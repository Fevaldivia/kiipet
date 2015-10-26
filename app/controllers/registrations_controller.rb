class RegistrationsController < Devise::RegistrationsController
  protected

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    # signed_in_root_path(resource)
    edit_user_registration_path
  end
end
