class AddLastNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :last_name, :string
  end
end
