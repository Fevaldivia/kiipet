class WizardsController < ApplicationController
  before_action :authenticate_user!

  def step_1
  end

  def create
    @graph = Koala::Facebook::API.new(current_user.fb_access_token)
    profile = @graph.get_object("me")
    current_user.create_profile(type: params[:keeperprofile][:profile_attributes][:type], name: profile["name"]) if current_user.profile.nil?
    redirect_to edit_profile_path(current_user.profile)  
  end
end
