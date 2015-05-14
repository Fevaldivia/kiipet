class CountiesController < ApplicationController
  before_action :authenticate_user!

  before_action :load_region!

  # GET /regions/1/counties
  def index
    @counties = @region.counties
  end

  private
    def load_region!
      @region = Region.find(params[:region_id])
    end
end
