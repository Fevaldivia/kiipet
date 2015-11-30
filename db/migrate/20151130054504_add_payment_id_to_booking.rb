class AddPaymentIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :payment_id, :string
  end
end
