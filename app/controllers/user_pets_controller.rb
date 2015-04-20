class UserPetsController < ApplicationController
    before_action :authenticate_user!

  # GET /user_pets
  def index
    @pets = current_user.pets
  end

end
