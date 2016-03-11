class ProfileService < ActiveRecord::Base

  belongs_to :profile
  belongs_to :service

  has_many :bookings

  accepts_nested_attributes_for :service

  def self.allowed_attributes
    [
      :price
    ]
  end

  def name_with_price
    "#{service.name} - $#{price}"
  end

  scope :get_price, ->(id) { find_by_profile_id(id).price }
end
