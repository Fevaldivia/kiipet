class PaymentsController < ApplicationController
  def thanks
    @booking = current_user.profile.bookings.last
    BookingMailer.confirmation(current_user, @booking).deliver_now
  end

  def notify
  end

  def cancel 
  end
end
