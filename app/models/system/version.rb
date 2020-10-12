class Version < ApplicationRecord
  extend Enumerize

  default_scope { order('created_at DESC') }

  serialize :fields_changed, Array
  serialize :body,           Hash

  enumerize :event,
            in:         I18n.t('enumerize.version.event').keys,
            i18n_scope: 'enumerize.version.event',
            predicates: {prefix: true}

  def editor
    User.find(self.editor_id) rescue nil
  end

  def model_object
    self.model.constantize
  end

  def model_instance
    self.model_object.find(self.model_id)
  end

  def previous
    self
      .model_instance
      .versions
      .where('versions.created_at < ?', self.created_at)
      .order('created_at DESC').first
  end

end
