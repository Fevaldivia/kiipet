class AddTakenToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :taken, :boolean, default: false
  end
end
