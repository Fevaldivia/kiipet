class WizardsController < ApplicationController
  before_action :authenticate_user!

  def step_1
    binding.pry
  end 
end
