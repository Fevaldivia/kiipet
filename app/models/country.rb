class Country < ActiveRecord::Base
  has_many :regions, dependent: :destroy

  validates :name, :code, presence: true
  validates :name, uniqueness: true

  def self.allowed_attributes
    [:name, :code]
  end
end
