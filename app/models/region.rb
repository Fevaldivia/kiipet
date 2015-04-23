class Region < ActiveRecord::Base
  include CountryHandler

  has_many :counties, dependent: :destroy

  validates :name, :short_name, :code, presence: true, uniqueness: true

  validates :country_code, presence: true

  def self.allowed_attributes
    [:name, :short_name, :code, :country_code]
  end
end
