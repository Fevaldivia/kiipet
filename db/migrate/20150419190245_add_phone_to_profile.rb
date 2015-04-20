class AddPhoneToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :phone, :string
    add_column :profiles, :rut, :string
  end
end
