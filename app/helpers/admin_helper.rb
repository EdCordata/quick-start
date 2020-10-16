module AdminHelper

  def admin_login_as_user_link(user, icon_only: false)
    link_to (icon_only ? fa_icon('exchange') : t('admin.views.users.login_as')),
            admin_user_login_as_path(user.id),
            title: t('admin.views.users.login_as'),
            class: 'btn btn-sm btn-warning',
            data:  {toggle: 'tooltip'} if can?(:login_as, user)
  end

end
