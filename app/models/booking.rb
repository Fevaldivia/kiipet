require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable

  belongs_to :profile
  belongs_to :service

  def payment!(current_user)
   amount = 1
   client = Khipu::PaymentsApi.new
   profile_service = self.service.profile_services.where(profile_id: current_user.profile.id).first
   amount = profile_service.price.to_i if profile_service.price.to_i > 0
   binding.pry
   response = client.payments_post("Kiipet - Pagar resevar", 'CLP', amount, {
      transaction_id: self.id,
      expires_date: DateTime.new(2016, 4, 4),
      body: 'Estas pagando el precio del servicio que solicitaste para tu mascota',
      picture_url: 'http://beta.kiipet.com/assets/logo-b3c6c14f85440776f61ce91dd045557e.png',
      return_url: 'http://localhost:3000/payments/thanks',
      cancel_url: 'http://localhost:3000/payments/cancel',
      #notify_url: 'http://mi-ecomerce.com/backend/notify',
      notify_api_version: '1.3'
   })
   self.payment_id = response.payment_id if response 
   self.save

    return response 
  end
end
