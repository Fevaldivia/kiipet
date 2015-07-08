class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :expirate
      t.date :service_date
      t.references :profile, index: true
      t.references :service, index: true

      t.timestamps null: false
    end
    add_foreign_key :calendars, :profiles
    add_foreign_key :calendars, :services
  end
end
