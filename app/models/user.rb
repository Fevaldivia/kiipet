class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_one :profile, inverse_of: :user, dependent: :destroy
  has_many :pets, dependent: :destroy
  validates :profile, presence: true

  accepts_nested_attributes_for :profile

  def display_image
    return self.gravatar_url || '/user.png' if profile.nil?
    return profile.avatar.url if profile.avatar?
    self.gravatar_url || '/user.png'
  end

  def gravatar_url
    return unless self.email
    "https://gravatar.com/avatar/#{Digest::MD5.new.update(self.email)}.jpg?default=http://#{Rails.configuration.default_url_options[:host]}/user.png"
  end

<<<<<<< HEAD
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)      
    user = User.where(provider: auth.provider, uid: auth.uid).first       
    return user if user    
    user = User.where(email: auth.info.email).first 
    return user if user
    binding.pry
    User.create(
    #  name: auth.extra.raw_info.name,
      provider: auth.provider, uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0,20])  
    end
=======
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)      
    user = User.where(provider: auth.provider, uid: auth.uid).first       
    if user
      user.update_attributes(fb_access_token: auth[:credentials][:token])
      return user
    end 

    user = User.where(email: auth.info.email).first 
    if user    
      user.update_attributes(fb_access_token: auth[:credentials][:token])
      return user
    end
    
    User.create(
      provider: auth.provider, uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0,20],  
      fb_access_token: auth[:credentials][:token])  
    
  end
>>>>>>> 47ce24c03e855d00d5429158c41d0cfd346f236a

end
