class ApplicationController < ActionController::Base
   include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Kiipet"
    title       = [controller_name, action_name].join(" ")
    description = "Kiipet es una plataforma que pone en contacto a cuidadores de mascotas con experiencia y propietarios de mascotas.
                         Nuestra plataforma permite que cada propietario encuentre el cuidador perfecto para su mascota,
                         haciendo la reserva de forma cómoda y garantizando el pago seguro"
    image       = options[:image] || "logo-azul.png"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[mascotas alojamiento paseos cuidadores veterinarias entrenamiento],
      twitter: {
        site_name: site_name,
        site: '@thecookieshq',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end


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
