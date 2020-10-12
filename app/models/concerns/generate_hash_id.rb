require 'securerandom'
require 'active_support/concern'

module GenerateHashId
  extend ::ActiveSupport::Concern

  included do

    before_save :auto_set_hash_id

    def auto_set_hash_id
      return unless self.hash_id.nil?

      new_hash_id = SecureRandom.uuid

      while self.class.where(hash_id: new_hash_id).first
        new_hash_id = SecureRandom.uuid
      end

      self.hash_id = new_hash_id
    end

  end
end
