class AddStateToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :state, :string
  end
end
