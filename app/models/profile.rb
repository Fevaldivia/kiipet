class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile

  enum gender: [:male, :female]

  validates :user, presence: true

  validates :name, :birthday, :gender, :cellphone, :address, presence: true, on: :update

  def self.allowed_attributes
    [:name, :gender, :birthday, :cellphone, :address]
  end
end
