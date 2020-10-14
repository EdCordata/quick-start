class Ability
  include CanCan::Ability

  def initialize(current_user, layout: 'application')
    shared(current_user)
    admin(current_user)       if layout == 'admin'
    application(current_user) if layout == 'application'
  end

  def shared(current_user)

    # Developer
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'developer'
      can :open, :admin
    end
    # -----------------------------------------------------------------------------

    # User
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'user'
    end
    # -----------------------------------------------------------------------------


    # Guest
    # -----------------------------------------------------------------------------
    unless current_user
    end
    # -----------------------------------------------------------------------------

  end

  def application(current_user)

    # Developer
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'developer'
    end
    # -----------------------------------------------------------------------------

    # User
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'user'
    end
    # -----------------------------------------------------------------------------


    # Guest
    # -----------------------------------------------------------------------------
    unless current_user
    end
    # -----------------------------------------------------------------------------

  end

  def admin(current_user)

    # Developer
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'developer'

      # Users
      can [:index, :show, :update], User
      can [:delete, :block],        User
      can [:view_versions],         User
      can :login_as,                User.where.not(id: current_user.id)
      can :change_user_role,        [:developer, :user]

    end
    # -----------------------------------------------------------------------------

    # User
    # -----------------------------------------------------------------------------
    if current_user.try(:role) == 'user'
    end
    # -----------------------------------------------------------------------------


    # Guest
    # -----------------------------------------------------------------------------
    unless current_user
    end
    # -----------------------------------------------------------------------------

  end

end
