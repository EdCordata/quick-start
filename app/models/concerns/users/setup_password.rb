require 'active_support/concern'

module Users
  module SetupPassword
    extend ::ActiveSupport::Concern

    included do


      attr_accessor :password

      attr_accessor :should_validate_password


      validates :password,
                length: {
                  minimum: Settings['users']['validations']['password']['min_length'],
                  maximum: Settings['users']['validations']['password']['max_length']
                },
                confirmation: true,
                if:           -> { self.should_validate_password }


      before_save :set_encrypted_password


      def password_is?(pass)
        ::BCrypt::Password.new(self.encrypted_password) == pass
      end


      private


      def set_encrypted_password
        return if self.password.nil?
        self.encrypted_password = ::BCrypt::Password.create(self.password)
      end


    end
  end
end
