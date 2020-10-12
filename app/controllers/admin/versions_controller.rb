class Admin::VersionsController < Admin::ApplicationController

  def show
    @version = Version.find(params[:id])

    if can?(:view_versions, User)
      @previous = @version.previous
    else
      redirect_to admin_path
    end
  end

end
