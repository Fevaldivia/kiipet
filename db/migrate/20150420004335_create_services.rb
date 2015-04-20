class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :price
      t.integer :profile_id

      t.timestamps null: false
    end
    add_index :services, :profile_id
  end
end
