class County < ActiveRecord::Base
  belongs_to :region

  validates :name, presence: true, uniqueness: true
  validates :region, presence: true

  has_many :profiles

  def self.allowed_attributes
    [:name]
  end
end
