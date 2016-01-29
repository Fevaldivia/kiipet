class PaymentsController < ApplicationController
  before_action :get_booking, only: [:booking]
  def details
    @payments = Payment.all
  end

  def thanks
    @booking = current_user.profile.bookings.last
    BookingMailer.confirmation(current_user, @booking).deliver_now
  end

  def notify
    notification_token = params["notification_token"]
    binding.pry

    client = Khipu::PaymentsApi.new
    binding.pry

    response = client.payments_get(notification_token)
    binding.pry
    if response.status == "done"
      binding.pry

      #alfanumerico
      puts "debugger: #{response}"
      binding.pry

      #booking_id, #profile_id, state, payment_id, cantidad
      booking = Booking.where(payment_id: response.payment_id).last
      payment = Payment.where(payment_id: response.payment_id).last
      puts "debugger: #{booking}"
      binding.pry

      puts "debugger: #{payment}"
      binding.pry

      unless booking.nil? and payment.nil?
        binding.pry

          payment.paid
          payment.save
          if booking.save
            render json: true, status: 200
          end
      else
        binding.pry

        render json: false, status: 422
      end
    else
      binding.pry

      render json: false, status: 422
    end
  end

  def booking
    @booking.profile_id = current_user.id

      if @booking.save
        flash[:success] = "Se ha reservado exitosamente. En unos minutos llegará un correo confirmando el pago."
        payment_url = @booking.payment!(thanks_payments_url,cancel_payments_url,notify_payments_url)
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
