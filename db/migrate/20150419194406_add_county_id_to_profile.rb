class AddCountyIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :county_id, :integer
  end
end
