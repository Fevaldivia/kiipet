class AddForeignKeyToCounty < ActiveRecord::Migration
  def change
    add_foreign_key :counties, :regions
  end
end
