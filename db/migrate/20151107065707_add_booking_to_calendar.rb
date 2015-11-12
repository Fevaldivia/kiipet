class AddBookingToCalendar < ActiveRecord::Migration
  def change
    add_reference :calendars, :booking, index: true
    add_foreign_key :calendars, :bookings
  end
end
