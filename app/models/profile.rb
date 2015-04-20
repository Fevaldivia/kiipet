class Profile < ActiveRecord::Base

  has_many :services, inverse_of: :profile, dependent: :destroy
  belongs_to :user, inverse_of: :profile
  belongs_to :county

  enum gender: [:masculino, :femenino]

  validates :user, presence: true

  validates :name, :birthday, :gender, :cellphone, :address, presence: true, on: :update

  has_attached_file :avatar, styles: {original: '40x40!'}
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  validates_attachment_size :avatar, :less_than => 5.megabytes

  def country_name
    return if country.nil?
    country.translations[I18n.locale.to_s] || country.name
  end

  def country
    ISO3166::Country[country_code]
  end

  def self.allowed_attributes
    [:name, :avatar, :country_code, :gender, :birthday, :county_id, :rut ,:phone, :cellphone, :address]
  end
end
