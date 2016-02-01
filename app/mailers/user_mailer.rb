class UserMailer < ApplicationMailer
  default from: 'matias@kiipet.com'

  def welcome_email(user)
    @registro = user
    @url  = 'http://example.com/login'
    attachments.inline['welcome_email.jpg'] = File.read("#{Rails.root}/app/assets/images/welcome_email.jpg")
    attachments.inline['funciona.png'] = File.read("#{Rails.root}/app/assets/images/funciona.png")
    attachments.inline['fb.png'] = File.read("#{Rails.root}/app/assets/images/fb.png")
    attachments.inline['tw.png'] = File.read("#{Rails.root}/app/assets/images/tw.png")
    attachments.inline['in.png'] = File.read("#{Rails.root}/app/assets/images/in.png")
    mail(to: @registro.email, subject: 'Bienvenido a Kiipet')
  end
end
