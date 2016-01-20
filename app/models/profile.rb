class Profile < ActiveRecord::Base
  include TranslatedAttributeValue::Base
  ratyrate_rateable "quality"

  after_create :assign_calendar
  after_initialize :set_initial_status

  has_many :profile_services
  has_many :services, through: :profile_services

  belongs_to :user, inverse_of: :profile
  belongs_to :county

  has_one :bank_account, inverse_of: :profile, dependent: :destroy
  has_many :calendars, inverse_of: :profile, dependent: :destroy

  has_many :bookings

  accepts_nested_attributes_for :bank_account
  accepts_nested_attributes_for :calendars
  accepts_nested_attributes_for :profile_services
  accepts_nested_attributes_for :county

  enum gender: [:male, :female]

  validates :user, presence: true

  has_attached_file :avatar, styles: {original: '200x200!'}
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  validates_attachment_size :avatar, :less_than => 5.megabytes

  state_machine :state, :initial => :in_analysis do
    state :in_analysis, :approved, :rejected

    state :approved do
      validates :name, presence: true
    end

    event :approve do
      transition in_analysis: :approved
    end

    event :reject do
      transition in_analysis: :rejected
      transition approved: :rejected
    end
  end

  attr_accessor :region_id

  def region_id
    county ? county.region_id : nil
  end


  def country_name
    return if country.nil?
    country.translations[I18n.locale.to_s] || country.name
  end

  def country
    ISO3166::Country[country_code]
  end

  def assign_calendar
    if calendars.length <= 0
      calendars.create(name: "Calendario")
    end
  end

  def set_initial_status
    self.state ||= :in_analysis
  end

  def self.allowed_attributes
    [:name, :bio, :slogan, :avatar, :country_code, :gender, :date_birth, :county_id, :rut ,:phone, :cellphone, :address,
    profile_services_attributes: [:id, :service_id, :price] ]
  end
end
