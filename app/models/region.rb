class Region < ActiveRecord::Base
  belongs_to :country
  has_many :counties, dependent: :destroy

  validates :name, :short_name, :code, presence: true, uniqueness: true
  validates :country, presence: true

  def self.allowed_attributes
    [:name, :short_name, :code]
  end
end
