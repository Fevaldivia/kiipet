class BankAccountType < ActiveRecord::Base
  has_many :bank_accounts, dependent: :destroy

  has_many :available_accounts, inverse_of: :bank_account_type
  has_many :banks, through: :available_accounts

  validates :name, presence: true, uniqueness: true

  def self.allowed_attributes
    [:name]
  end
end
