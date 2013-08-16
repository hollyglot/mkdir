class StaffMember < ActiveRecord::Base
  validates :city, :state, :postal_code, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :blog, :city, :country, :developer_type, :github, :gmaps, :gmaps, :latitude, :linkedin, :linkedin_info, :longitude, :name, :phone, :postal_code, :state, :twitter, :website
end
