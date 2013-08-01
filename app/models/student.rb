class Student < ActiveRecord::Base
  validates :first_name, :last_name, :cohort, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :address_1, :address_2, :latitude, :longitude, :blog, :city, :cohort, :country, :entrepreneur, :first_name, :full_name, :github, :job_status, :last_name, :mentor, :personal_website, :phone_number, :postal_code, :state_province, :twitter_handle, :linkedin, :user_id
  # geocoded_by :addressMerge
  # after_validation :geocode, :if => :address_changed?

  before_save :populate_full_name

  before_index :grab_linkedin_info

  private
  
  def addressMerge
    self.address = "#{self.address_1} #{self.address_2}"
  end

  def populate_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def self.search_location(query)
    # put in method to find profiles by distance
    geolocator
  end

  def self.search_name(query)
    # method that finds profiles by name
    where('full_name LIKE ?', "%#{query.gsub(/ /, '%')}%")
    geolocator
  end

  def geolocator
    # create a method that populates pins on map
  end

  def grab_linkedin_info 

    self.each do |student|
      profile = Linkedin::Profile.get_profile(student.linkedin)
    end
  end


end
