module AdminHelper

  def admin_user_role_options(user)
    User.role.options.select do |name, role|
      user.role == role || can?(:change_user_role, role.to_sym)
    end
  end

  def admin_login_as_user_link(user, icon_only: false)
    link_to (icon_only ? fa_icon('exchange') : t('admin.views.users.login_as')),
            admin_login_as_user_path(user.id),
            title: t('admin.views.users.login_as'),
            class: 'btn btn-sm btn-warning',
            data:  {toggle: 'tooltip'} if can?(:login_as, user)
  end

end
