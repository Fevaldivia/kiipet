class AddProfileServiceToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :profile_service, index: true
    add_foreign_key :bookings, :profile_services
  end
end
