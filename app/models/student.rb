class Student < ActiveRecord::Base
  validates :first_name, :last_name, :cohort, :user_id, presence: true
  belongs_to :user
  attr_accessible :address_1, :address_2, :blog, :city, :cohort, :country, :entrepreneur, :first_name, :github, :job_status, :last_name, :linkedin_id, :mentor, :personal_website, :phone_number, :postal_code, :state_province, :twitter_handle, :linkedin, :user_id
  acts_as_gmappable
  
def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street}, #{self.city}, #{self.country}" 
end

end
