class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :require_admin

  def current_ability
    @current_ability ||= Ability.new(current_user, layout: 'admin')
  end

end
