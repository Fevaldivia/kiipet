class HomeController < ApplicationController
  def index
    @search = Profile.where(type: "KeeperProfile").ransack(params[:q])
    @keepers = @search.result.includes(:county)
  end
  def contact
  end
  def terms
  end
  def works
  end
end
