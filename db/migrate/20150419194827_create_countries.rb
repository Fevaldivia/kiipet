class CreateCountries < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :name
      t.belongs_to :region, index: true

      t.timestamps null: false
    end
    add_foreign_key :counties, :regions
  end
end
