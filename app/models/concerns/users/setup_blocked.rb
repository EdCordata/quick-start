require 'active_support/concern'

module Users
  module SetupBlocked
    extend ::ActiveSupport::Concern

    included do


      validates :blocked_reason,
                presence: true,
                if:       -> { self.blocked }


      scope :blocked,     -> { where(blocked: true) }
      scope :not_blocked, -> { where(blocked: false) }


      before_save :clear_blocked_reason_if_not_blocked_anymore


      def clear_blocked_reason_if_not_blocked_anymore
        if self.blocked_changed? && !self.blocked?
          self.blocked_reason = nil
        end
      end


    end
  end
end
