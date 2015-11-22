class AddSizeOptionToPets < ActiveRecord::Migration
  def change
    add_column :pets, :size, :int
  end
end
