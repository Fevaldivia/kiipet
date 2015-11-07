class AddProfileIdToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :profile_id, :integer
    add_index :calendars, :profile_id
  end
end
