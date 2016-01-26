class PaymentsController < ApplicationController
  before_action :get_booking, only: [:booking]

  def thanks
    @booking = current_user.profile.bookings.last
    BookingMailer.confirmation(current_user, @booking).deliver_now
  end

  def notify
  end

  def booking
    @booking.profile_id = current_user.id

      if @booking.save
        flash[:success] = "Se ha reservado exitosamente"
        payment_url = @booking.payment!
        redirect_to payment_url.payment_url
      else
        flash[:success] = "Ha ocurrido un error. Intente más tarde"
        redirect_to root_path
      end
  end

  def cancel
  end

  private

    def get_booking
      @booking = Booking.find(params[:id])
    end
end
