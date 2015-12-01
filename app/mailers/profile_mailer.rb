class ProfileMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  def approved profile
    @profile = profile

    mail to: @profile.user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #
  def rejected profile, message
    @profile = profile
    @message = message

    mail to: @profile.user.email
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
