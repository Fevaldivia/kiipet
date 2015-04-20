class CreateProspectorProfiles < ActiveRecord::Migration
  def change
    create_table :prospector_profiles do |t|

      t.timestamps null: false
    end
  end
end
