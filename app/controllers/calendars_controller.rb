class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_profile

  def index
    @calendars = @profile.calendars
  end

  def new
    @calendar = @profile.calendars.build
  end

  def create
    @calendar = @profile.calendars.build calendar_params
    if @calendar.save
      name = @calendar.name
      redirect_to calendars_path
      flash[:notice] = "#{name} creado"
    else
      render 'new'
      flash[:error] = "No ha sido posible crear el calendario. Porfavor intente nuevamente"
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    @calendar.update calendar_params
    if @calendar.save
      flash[:notice] = "Your calendar was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def calendar_params
      params.require(:calendar).permit(:name, :delete)
    end

    def set_current_profile
      @profile = current_user.profile
    end
end
