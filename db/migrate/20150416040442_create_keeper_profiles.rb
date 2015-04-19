class CreateKeeperProfiles < ActiveRecord::Migration
  def change
    create_table :keeper_profiles do |t|

      t.timestamps null: false
    end
  end
end
