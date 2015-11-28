class AddServiceIdToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :service, index: true
    add_foreign_key :bookings, :services
  end
end
