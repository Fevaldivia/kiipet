class County < ActiveRecord::Base
  belongs_to :region

  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
end
