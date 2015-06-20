class ProfileService < ActiveRecord::Base

  belongs_to :profile
  belongs_to :service

  def self.allowed_attributes
    [
      :price
    ]
  end
end
