class Profile < ActiveRecord::Base

  has_many :calendars
  has_many :services, through: :calendars

  has_many :profile_services
  has_many :services, through: :profile_services

  belongs_to :user, inverse_of: :profile
  belongs_to :county

  has_one :bank_account, inverse_of: :profile, dependent: :destroy

  accepts_nested_attributes_for :bank_account
  accepts_nested_attributes_for :profile_services
  accepts_nested_attributes_for :county

  enum gender: [:masculino, :femenino]

  # validate :services_quantity

  attr_accessor :region_id

  def region_id
    county ? county.region_id : nil
  end

  # def services_quantity
  #   errors.add(:services, 'Deben ser 3') unless services.size == 3
  # end

  validates :user, presence: true

  has_attached_file :avatar, styles: {original: '200x200!'}
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
    [:name, :bio, :slogan, :avatar, :country_code, :gender, :birthday, :county_id, :rut ,:phone, :cellphone, :address,
    profile_services_attributes: [:id, :service_id, :price] ]
  end
end
