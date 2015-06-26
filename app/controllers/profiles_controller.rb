class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # before_action :check_current_profile, only: [:edit, :update]

  def show
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile

    @profile.build_bank_account unless @profile.bank_account.present?

    @services = Service.all
    @services.each do |service|
        @profile.profile_services.build(service: service) unless @profile.services.any?
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path(@profile), notice: t(:update, scope: [:messages, :controllers, :profiles, :successfully]) }
        format.json { render :show, status: :ok, location: edit_profile_path(@profile) }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(Profile.allowed_attributes,
        bank_account_attributes: BankAccount.allowed_attributes)
    end

    def check_current_profile
      raise ActiveRecord::RecordNotFound if current_user.profile.id != params[:id].to_i
    end
end
