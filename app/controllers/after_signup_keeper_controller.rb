class AfterSignupKeeperController < ApplicationController
  before_action :authenticate_user!

  include Wicked::Wizard
   before_action :set_profile, only: [:show, :update]

  steps :step1, :step2, :step3, :step4

    def new
      @profile = current_user.build_profile
      render_wizard
    end

    def create
      @profile = current_user.build_profile profile_params_step1
      if @profile.save
        redirect_to after_signup_keeper_path(next_step, profile_id: @profile)
      else
        render_wizard
      end
  end

  def show
    send("set_#{step}_defaults") if steps.include? step

    render_wizard
  end

  def update
    @profile.assign_attributes send("profile_params_#{step}")

    send("set_#{step}_defaults") if steps.include? step

    @profile.save

    render_wizard @profile
  end

      private
      def set_step1_defaults
      end

      def set_step2_defaults
      end

      def set_step3_defaults
      end

      def set_step4_defaults
      end

      def set_profile
        @profile = current_user.profile.find(params[:id])
      end
      # Never trust parameters from the scary internet, only allow the white list through.
      def profile_params_step1
        params.require(:profile).permit(Profile.allowed_attributes)
      end

      def profile_params_step2
        params.require(:profile).permit()
      end

      def profile_params_step3
        params.require(:profile).permit()
      end

      def profile_params_step4
        params.require(:profile).permit()
      end

      def finish_wizard_path
        profile_path(current_user)
      end

end
