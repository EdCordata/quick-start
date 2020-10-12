module SetupAdmin
  extend ActiveSupport::Concern

  included do

    def require_admin
      redirect_to root_path unless can?(:open, :admin)
    end

  end

end
