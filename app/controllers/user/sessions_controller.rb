class User::SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]
  before_action :require_user,    only: [:destroy]

  def new; end

  def create
    @user = User.not_deleted.find_by(email: params.dig(:user, :email))

    if @user
      if @user.password_is?(params.dig(:user, :password))
        if @user.blocked?
          render_blocked
        else
          sign_in
        end
      else
        render_wrong_password
      end
    else
      render_wrong_password
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def sign_in
    session[:user_id] = @user.hash_id
    redirect_to root_path
  end

  def render_blocked
    flash.now[:alert] = t('flash_messages.user.sessions.user_blocked')
    render :new
  end

  def render_wrong_password
    flash.now[:alert] = t('flash_messages.user.sessions.wrong_email_or_password')
    render :new
  end

end
