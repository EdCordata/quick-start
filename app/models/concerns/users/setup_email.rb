require 'active_support/concern'

module Users
  module SetupEmail
    extend ::ActiveSupport::Concern

    included do


      validates :email,
                length:     {
                  minimum: Settings['users']['validations']['email']['min_length'],
                  maximum: Settings['users']['validations']['email']['max_length']
                },
                presence:   true,
                uniqueness: { case_sensitive: false },
                format:     /\S+@\S+\.\S+/,
                if:         Proc.new { |m| m.deleted == false }


    end
  end
end
