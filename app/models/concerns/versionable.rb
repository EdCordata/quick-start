=begin

  class Project < ApplicationRecord
    include Versionable

    private

    def set_version
      self.version_body = {
        name: self.name,
        tags: self.tags.map(&:name)
        etc:  '...'
      }
    end
  end


  class ProjectsController < ApplicationController

    def create
      @project = Project.find(params[:id])

      @project.editor_id           = current_user.id
      @project.version_event       = 'custom_event' # default is :update or :create, depending if record new
      @project.dont_create_version = false # true will skip version creation

      @project.save
      redirect_to projects_path
    end

  # You can manually call save, like so:
  @project.create_version(editor_id: current_user.id, version_event: 'admin_update')

=end


require 'active_support/concern'

module Versionable
  extend ActiveSupport::Concern

  included do

    attr_accessor :editor_id, :version_event, :dont_create_version, :version_body

    after_destroy { |record| ::Version.where(model: record.class.name, model_id: record.id).delete_all }
    after_save    :set_version, :create_version
    after_destroy :remove_version

    def versions
      ::Version.where(model: self.class.name, model_id: self.id).order('created_at DESC')
    end

    def create_version(options = {})
      return if self.dont_create_version

      last_version = self.versions.order('created_at DESC').first

      if last_version.nil? || (last_version && last_version.body.to_json != version_body.to_json)
        fields_changed = if last_version.nil?
                           version_body.keys
                         else
                           version_body.keys.select {|key| version_body[key] != last_version.body[key]}
                         end

        ::Version.create!(
          event:          (options[:version_event] || self.version_event || (last_version.nil? ? 'create' : 'update')),
          model:          self.class.name,
          model_id:       self.id,
          editor_id:      (options[:editor_id] || self.editor_id),
          fields_changed: fields_changed,
          body:           version_body
        )
      end
    end

    def remove_version
      ::Version.where(model: self.class.name, model_id: self.id).delete_all
    end

  end

  module ClassMethods

    def versions
      ::Version.where(model: self.to_s).order('created_at DESC')
    end

  end
end
