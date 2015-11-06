class Calendar < ActiveRecord::Base
  belongs_to :profile
  belongs_to :service

  def self.allowed_attributes
    [ :expirate, :service_date]
  end
end
