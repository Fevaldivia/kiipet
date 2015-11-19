class AddDateBirthAttributeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :date_birth, :string
  end
end
