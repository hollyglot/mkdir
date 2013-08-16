class HiringPartner < ActiveRecord::Base
  validates :linkedin, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :gmaps, :latitude, :linkedin, :linkedin_info, :longitude
end
