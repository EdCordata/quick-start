class User::RegistrationsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]
  before_action :set_user,        only: [:new, :create]

  def new; end

  def create
    if @user.update(user_params)
      session[:user_id] = @user.hash_id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.new
  end

  def user_params
    params[:user] ||= {}

    params[:user][:should_validate_password] = true

    params.require(:user).permit(
      :email, :locale,
      :password, :password_confirmation,
      :should_validate_password
    )
  end

end
