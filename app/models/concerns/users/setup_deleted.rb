require 'active_support/concern'

module Users
  module SetupDeleted
    extend ::ActiveSupport::Concern

    included do

      scope :deleted,     -> { where(deleted: true) }
      scope :not_deleted, -> { where(deleted: false) }

    end
  end
end
