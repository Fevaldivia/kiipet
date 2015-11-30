require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable

  belongs_to :profile
  belongs_to :service

  def payment!
   amount = 1
   client = Khipu::PaymentsApi.new
   amount = self.service.price.to_i if self.service.price.to_i > 0

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
   
    #agregar id de pago en booking, payment_id 

    return response 
  end
end
