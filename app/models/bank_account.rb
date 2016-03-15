class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :bank_account_type
  belongs_to :profile, inverse_of: :bank_account

  def self.allowed_attributes
    [:bank_id, :bank_account_type_id, :number]
  end
end
