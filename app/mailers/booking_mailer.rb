class BookingMailer < ApplicationMailer
  def confirmation(user, booking)
    @user = user, @booking = booking 
    mail to: user.email, subject: "Mail de confirmación de reserva", from: "Matias Roman de Kiipet<matias@kiipet.cl>"
  end
end
