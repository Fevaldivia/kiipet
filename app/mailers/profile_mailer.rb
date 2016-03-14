class ProfileMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  def approved profile
    @profile = profile

    attachments.inline['welcome_email.jpg'] = File.read("#{Rails.root}/app/assets/images/welcome_email.jpg")
    attachments.inline['fb.png'] = File.read("#{Rails.root}/app/assets/images/fb.png")
    attachments.inline['tw.png'] = File.read("#{Rails.root}/app/assets/images/tw.png")
    attachments.inline['in.png'] = File.read("#{Rails.root}/app/assets/images/in.png")

    mail to: @profile.user.email, subject: 'Perfil Aprobado en Kiipet.com'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #
  def rejected profile
    @profile = profile

    attachments.inline['welcome_email.jpg'] = File.read("#{Rails.root}/app/assets/images/welcome_email.jpg")
    attachments.inline['fb.png'] = File.read("#{Rails.root}/app/assets/images/fb.png")
    attachments.inline['tw.png'] = File.read("#{Rails.root}/app/assets/images/tw.png")
    attachments.inline['in.png'] = File.read("#{Rails.root}/app/assets/images/in.png")

    mail to: @profile.user.email,  subject: 'Perfil Rechazado en Kiipet.com'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #
  def send_to_revision profile
    @profile = profile

    mail to: Rails.application.secrets.admins_emails
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #

  # not approved company
  def not_yet_approved profiles
    @profiles = profiles

    mail to: Rails.application.secrets.admins_emails
  end
end
