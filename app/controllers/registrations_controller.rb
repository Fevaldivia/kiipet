class RegistrationsController < Devise::RegistrationsController
  protected
  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_sign_up_path_for(resource)
     if current_user.role.name == "keeper"
        new_after_signup_keeper_path(:step1)
     else
        new_after_signup_keeper_path(:step1)
     end
  end


  def after_sign_in_path_for(user)
    # return the path based on resource
    if current_user.role.name == "keeper" && current_user.role.name == "owner"
      profile_dashboard_path(current_user)
    else
      sign_in user
      step_1_wizards_path
    end
  end

  def after_update_path_for(resource)
    # signed_in_root_path(resource)
    edit_user_registration_path
  end
end
