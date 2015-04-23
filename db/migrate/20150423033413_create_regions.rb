class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :short_name
      t.string :code
      t.string :country_code

      t.timestamps null: false
    end
  end
end
