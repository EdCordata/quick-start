class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user.present?

      # Developer
      # -----------------------------------------------------------------------------
      if current_user.role == 'developer'
      end
      # -----------------------------------------------------------------------------

      # User
      # -----------------------------------------------------------------------------
      if current_user.role == 'user'
      end
      # -----------------------------------------------------------------------------

    end

    # Guest
    # -----------------------------------------------------------------------------
    # -----------------------------------------------------------------------------

  end
end