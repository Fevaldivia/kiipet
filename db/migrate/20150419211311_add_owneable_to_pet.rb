class AddOwneableToPet < ActiveRecord::Migration
  def change
    add_reference :pets, :owneable, polymorphic: true, index: true
    add_column :pets, :user_id, :integer
    add_index :pets, :user_id
  end
end
