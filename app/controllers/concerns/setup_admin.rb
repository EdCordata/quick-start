module SetupAdmin
  extend ActiveSupport::Concern

  included do

    def require_admin
    end

  end

end
