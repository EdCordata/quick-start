module SetupCurrentUser
  extend ActiveSupport::Concern

  included do

    helper_method :current_user

    def current_user
      return nil unless session[:user_id]

      user = User.find_by(hash_id: session[:user_id])

      return nil unless user

      if user.deleted?
        session[:user_id] = nil
        return nil
      end

      if user.blocked?
        session[:user_id] = nil
        return nil
      end

      user
    end

    def require_user
      redirect_to sign_in_path unless current_user
    end

    def require_no_user
      redirect_to root_path if current_user
    end

  end
end
