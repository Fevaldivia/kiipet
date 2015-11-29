class Pet < ActiveRecord::Base
  include TranslatedAttributeValue::Base
  include Owneable

  has_attached_file :pet_image, styles: {original: '200x200!'}
  validates_attachment_content_type :pet_image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  validates_attachment_size :pet_image, :less_than => 5.megabytes

  enum size: [:Pequeño, :Mediano, :Grande]

  def self.allowed_attributes
    [ :name, :pet_image, :bio, :size, :breed, :owneable_gid]
  end
end
