class Student < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address_1, :address_2, :blog, :city, :cohort, :country, :entrepreneur, :first_name, :github, :job_status, :last_name, :linkedin_id, :mentor, :personal_website, :phone_number, :postal_code, :state_province, :twitter_handle
end