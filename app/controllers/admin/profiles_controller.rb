class Admin::ProfilesController < Admin::AdminController
  before_action :set_profile, only: [:show, :edit, :update, :approve, :reject]

  # GET /backend/profiles
  def index
    @profiles = Profile.all
  end

  # GET /backend/profiles/1
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /backend/companies/1/approve
  def approve
    if @profile.approve
      # CompanyMailer.approved(@company).deliver_later

      flash[:notice] = t(:approved, scope: [:messages, :controllers, :profiles, :successfully])
    else
      flash[:error] = @profile.errors.full_messages.join(', ')
    end

    respond_to do |format|
      format.html { redirect_to admin_profile_path(@profile) }
    end
  end


  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(Profile.allowed_attributes)
    end
end
