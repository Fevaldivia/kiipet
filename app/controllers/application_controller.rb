class ApplicationController < ActionController::Base
   include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:terms_of_service, :email, :password, :password_confirmation,
                                                profile_attributes: [:type]) }

      devise_parameter_sanitizer.for(:account_update) << :newsletter
    end
  def after_sign_in_path_for(user)
    # return the path based on resource
    if current_user
      edit_profile_path(current_user.profile)
    else
      sign_in user
      step_1_wizards_path
    end
  end
end
