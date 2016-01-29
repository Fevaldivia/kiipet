class ChangeTypeToPaymentIdToPayments < ActiveRecord::Migration
  def change
    change_column :payments, :payment_id, :string
  end
end
