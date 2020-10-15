class User < ApplicationRecord
  include GenerateHashId
  include Versionable

  include Users::SetupEmail
  include Users::SetupLocale
  include Users::SetupDeleted
  include Users::SetupBlocked
  include Users::SetupPassword
  include Users::SetupPermissions

  scope :valid, -> { where(deleted: false, blocked: false) }

  private

  def set_version
    self.version_body = {
      role:               self.role,
      email:              self.email,
      deleted:            self.deleted,
      blocked:            self.blocked,
      blocked_reason:     self.blocked_reason,
      encrypted_password: self.encrypted_password
    }
  end

end
