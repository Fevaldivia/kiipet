class AddProfileIdToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :profile, index: true
    add_foreign_key :bookings, :profiles
  end
end
