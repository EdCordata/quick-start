require 'active_support/concern'

module Users
  module SetupLocale
    extend ::ActiveSupport::Concern

    included do

      aasm column: :locales do
        state :en, initial: true
      end

      enumerize :locale,
                in:         I18n.t('locales').keys,
                i18n_scope: 'locales',
                predicates: { prefix: true }

    end
  end
end
