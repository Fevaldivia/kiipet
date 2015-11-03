class KeeperUsersController < ApplicationController
  before_action :authenticate_user!
  # GET /user_pets
  def index
    @keepers = Profile.where(type: "KeeperProfile")
    if params[:search]
      @keepers = Profile.search(params[:search]).order("created_at DESC")
   else
      @keepers = Profile.where(type: "KeeperProfile").order('created_at DESC')
    end
  end
end
