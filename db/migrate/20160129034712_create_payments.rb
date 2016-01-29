class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :booking, index: true
      t.references :profile, index: true
      t.integer :state
      t.string :token
      t.integer :amount
      t.integer :payment_id

      t.timestamps null: false
    end
    add_foreign_key :payments, :bookings
    add_foreign_key :payments, :profiles
  end
end
