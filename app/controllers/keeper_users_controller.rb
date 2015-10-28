class KeeperUsersController < ApplicationController
  before_action :authenticate_user!
  # GET /user_pets
  def index
    @keepers = Profile.where(type: "KeeperProfile")
  end
end
