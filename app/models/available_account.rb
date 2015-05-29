class AvailableAccount < ActiveRecord::Base
  belongs_to :bank, inverse_of: :available_accounts
  belongs_to :bank_account_type, inverse_of: :available_accounts

  #validacion unicidad
  validates :bank_account_type, presence: true
  validates :bank,  presence: true

  validates :bank_account_type_id, uniqueness: {scope: :bank_id}

  def self.allowed_attributes
    [:bank_id, :bank_account_type_id]
  end
end
