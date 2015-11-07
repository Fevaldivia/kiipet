class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create(calendar_params)
    if @calendar.save
      name = @calendar.name
      redirect_to calendars_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create calendar. Please try again"
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

end
