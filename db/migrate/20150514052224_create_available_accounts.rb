class CreateAvailableAccounts < ActiveRecord::Migration
  def change
    create_table :available_accounts do |t|
      t.belongs_to :bank, index: true
      t.belongs_to :bank_account_type, index: true

      t.timestamps null: false
    end
  end
end
