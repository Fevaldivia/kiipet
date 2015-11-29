class BookingMailer < ApplicationMailer
  def confirmation(user, booking)
    @user = user, @booking = booking 
    mail to: user.email, subject: "Reserva confirmada Kiipet.com", from: "Matias Roman<matias@kiipet.cl>"
  end
end
