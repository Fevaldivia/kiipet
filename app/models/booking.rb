require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable

  belongs_to :profile
  belongs_to :profile_service

  def payment!
   amount = 1
   client = Khipu::PaymentsApi.new
   profile_service = self.profile_service
   amount = profile_service.price.to_i if profile_service.price.to_i > 0
   response = client.payments_post("Kiipet - Pagar resevar", 'CLP', amount, {
      transaction_id: self.id,
      expires_date: DateTime.new(2016, 4, 4),
      body: 'Estas pagando el precio del servicio que solicitaste para tu mascota',
      picture_url: 'http://beta.kiipet.com/assets/logokhipupayment-ffefb9825d678627a873db3c4299143d860333a0a8fd6d4fe711de4d23b24f8f.png',
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
