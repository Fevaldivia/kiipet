class ServicesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_current_profile
  before_action :set_service, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @services = @profile.services
  end

  def new
    @service = @profile.services.build
  end

  def edit
  end

  def create
    @service = @profile.services.build service_params
    if @service.save
      redirect_to services_path, notice: t(:create, scope: [:messages, :controllers, :services, :successfully])
    else
      render 'new'
    end
  end

  def update
    if @service.update(service_params)
      redirect_to services_path, notice: t(:update, scope: [:messages, :controllers, :services, :successfully])
    else
      render 'edit'
    end
  end

  def destroy
    @services.destroy

    redirect_to services_url, notice: t(:destroy, scope: [:messages, :controllers, :services, :successfully])
  end

  private
    def set_service
      @service = @profile.services.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(Service.allowed_attributes)
    end

    def set_current_profile
      @profile = current_user.profile
    end
end
