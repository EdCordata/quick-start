require 'active_support/concern'

module Users
  module SetupPermissions
    extend ::ActiveSupport::Concern

    included do


      delegate :can?, :cannot?, :to => :ability


      def ability
        @ability ||= Ability.new(self)
      end


      aasm column: :role do
        state :user, initial: true
        state :developer
      end


      enumerize :role,
                in:         I18n.t('enumerize.user.role').keys,
                i18n_scope: 'enumerize.user.role',
                predicates: { prefix: true }


    end
  end
end
