class CreateProfileServices < ActiveRecord::Migration
  def change
    create_table :profile_services do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :service, index: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
