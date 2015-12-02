class KeeperUsersController < ApplicationController
  before_action :authenticate_user!
  # GET /keeper_users
  def index
      @search = Profile.where(type: "KeeperProfile").ransack(params[:q])
      @keepers = @search.result.includes(:county).page(params[:page]).per(8)
  end

end
