class Admin::UsersController < Admin::ApplicationController
  load_and_authorize_resource


  def index
    params[:q] ||= { deleted_eq: false, blocked_eq: false }

    @q     = @users.ransack(params[:q])
    @users = @q.result(distinct: true)
    @users = @users.page(params[:page]).per(20)
  end


  def show
    @versions = @user.versions.page(params[:page]).per(20)
  end


  def edit; end


  def update
    @user.editor_id     = current_user.id
    @user.version_event = 'admin_update'

    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end


  def login_as
    session[:user_id] = @user.hash_id if can?(:login_as, @user)
    redirect_to admin_users_path
  end


  private


  def user_params
    permitted_params =  [:email, :locale]
    permitted_params += [:deleted]                  if can?(:delete, @user)
    permitted_params += [:blocked, :blocked_reason] if can?(:block, @user)

    if can? :change_user_role, params.dig(:user, :role).to_sym
      permitted_params << :role
    end

    params.require(:user).permit(permitted_params)
  end


end
