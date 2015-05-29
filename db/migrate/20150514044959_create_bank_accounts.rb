class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.belongs_to :bank, index: true
      t.belongs_to :bank_account_type, index: true
      t.belongs_to :profile, index: true
      t.string :number

      t.timestamps null: false
    end
    add_foreign_key :bank_accounts, :banks
    add_foreign_key :bank_accounts, :bank_account_types
    add_foreign_key :bank_accounts, :profiles
  end
end
