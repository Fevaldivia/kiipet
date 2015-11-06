class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @calendar = current_user.calendars.build calendar_params

    respond_to do |format|
      if @calendar.save

      else

      end
    end
  end

  def index
    @calendars = current_user.calendars
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(Calendar.allowed_attributes)
    end
end
