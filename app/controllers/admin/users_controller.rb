class Admin::UsersController < Admin::ApplicationController
  before_action :find_user,     only: [:show, :edit, :update, :login_as]
  before_action :validate_edit, only: [:edit, :update]

  authorize_resource only: [:show, :edit, :update]


  def index
    authorize!(:open, :admin_users)

    params[:q] ||= { deleted_eq: false, blocked_eq: false }

    @q     = User.ransack(params[:q])
    @users = @q.result(distinct: true).accessible_by(current_ability)
    @users = @users.page(params[:page]).per(20)
  end


  def show
    if can?(:show, @user)
      @versions = @user.versions.page(params[:page]).per(20)
    else
      redirect_to admin_users_path
    end
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


  def find_user
    @user = User.find(params[:id])
  end


  def validate_edit
    redirect_to admin_users_path unless can?(:edit, @user)
  end


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
