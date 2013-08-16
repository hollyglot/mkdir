class StaffMember < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :blog, :city, :country, :developer_type, :github, :gmaps, :gmaps, :latitude, :linkedin, :linkedin_info, :longitude, :name, :phone, :postal_code, :state, :twitter, :website
end
