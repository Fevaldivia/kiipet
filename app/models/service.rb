class Service < ActiveRecord::Base
  belongs_to :profile, inverse_of: :services

  def self.allowed_attributes
    [
      :name, :description, :price
    ]
  end
end
