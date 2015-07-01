class KeeperUsersController < ApplicationController

  # GET /user_pets
  def index
    @keepers = Profile.where(type: "KeeperProfile")
  end

end
