class WizardsController < ApplicationController
  before_action :authenticate_user!

  def step_1
<<<<<<< HEAD
    binding.pry
  end 
=======
  end

  def create
    @graph = Koala::Facebook::API.new(current_user.fb_access_token)
    profile = @graph.get_object("me")
    current_user.create_profile(type: params[:keeperprofile][:profile_attributes][:type], name: profile["name"]) if current_user.profile.nil?
    redirect_to edit_profile_path(current_user.profile)  
  end
>>>>>>> 47ce24c03e855d00d5429158c41d0cfd346f236a
end
