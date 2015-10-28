class Api::V1::CalendarsController < ApplicationController
  respond_to :json
  before_action :get_profile

  def index
    respond_with @profile.services, status: 200
  end

  def create
    @calendar = current_user.profile.calendars calendar_params
    if @calendar.save
    else
    end
  end

  private

  def get_profile
    @profile = current_user.profile
  end

  def calendar_params
    params.require(:calendar).permit(Calendar.allowed_attributes)
  end
end
