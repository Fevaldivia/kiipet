class Service < ActiveRecord::Base

  has_many :profile_services
  has_many :profiles, through: :profile_services

  has_many :calendars
  has_many :profiles, through: :calendars

  def self.allowed_attributes
    [
      :name, :description
    ]
  end
end
