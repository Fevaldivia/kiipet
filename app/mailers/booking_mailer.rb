class BookingMailer < ApplicationMailer
  def confirmation(current_user, booking)
    @user = current_user
    @booking = booking 
    mail to: @user.email, subject: "Reserva confirmada Kiipet.com", from: "Matias Roman<matias@kiipet.cl>"
  end
end
