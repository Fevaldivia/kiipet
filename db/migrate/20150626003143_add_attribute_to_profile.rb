class AddAttributeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :slogan, :string
    add_column :profiles, :bio, :text
  end
end
