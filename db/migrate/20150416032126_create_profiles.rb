class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :gender
      t.date :birthday
      t.string :cellphone
      t.string :address
      t.string :type

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end
