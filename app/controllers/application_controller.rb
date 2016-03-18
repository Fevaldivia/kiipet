class ApplicationController < ActionController::Base
   include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


protected
  before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role_id, :terms_of_service, :email, :password, :password_confirmation, :role_ids => [], role_attributes: [:id, :name]) }

      devise_parameter_sanitizer.for(:account_update) << :newsletter
    end
  def after_sign_in_path_for(user)
    # return the path based on resource
    if current_user.role.name == "keeper"
      after_signup_keeper_path(:step1)
    else
      sign_in user
      step_1_wizards_path
    end
  end
end
