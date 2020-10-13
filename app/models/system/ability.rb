class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user.present?

      # Developer
      # -----------------------------------------------------------------------------
      if current_user.role == 'developer'

        # Admin
        can :open, [:admin, :admin_users]

        # Admin Users
        can [:login_as],           User
        can [:view_versions],      User
        can [:delete, :block],     User.where.not(id: current_user.id)
        can [:show, :edit, :read], User
        can :change_user_role, [:user, :developer]

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
