class Admin::ProfilesController < Admin::AdminController
  # GET /backend/profiles
  def index
    @profiles = Profile.all
  end

  # GET /backend/profiles/1
  def show
    @profile = Profile.find(params[:id])
  end
end
