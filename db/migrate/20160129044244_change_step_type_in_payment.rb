class ChangeStepTypeInPayment < ActiveRecord::Migration
  def change
    change_column :payments, :state, :string
  end
end
