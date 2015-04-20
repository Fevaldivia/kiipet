class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, inverse_of: :user, dependent: :destroy
  has_many :pets, dependent: :destroy
  validates :profile, presence: true

  accepts_nested_attributes_for :profile

  def display_image
    return profile.avatar.url if profile.avatar?
    self.gravatar_url || '/user.png'
  end

  def gravatar_url
    return unless self.email
    "https://gravatar.com/avatar/#{Digest::MD5.new.update(self.email)}.jpg?default=http://#{Rails.configuration.default_url_options[:host]}/user.png"
  end
end
