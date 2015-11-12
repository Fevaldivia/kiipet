class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length
      t.belongs_to :calendar, index: true
    end
    add_foreign_key :bookings, :calendars
  end
end
