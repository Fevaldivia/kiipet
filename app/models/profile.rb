class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile

  enum gender: [:male, :female]

  validates :user, presence: true

  validates :name, :birthday, :gender, :cell_phone, :address, presence: true, on: :update

  def self.allowed_attributes
    [:name, :gender, :birthday, :cell_phone, :address]
  end
end
