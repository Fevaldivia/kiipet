class AddCountryCodeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :country_code, :string
  end
end
