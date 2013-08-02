class Student < ActiveRecord::Base
  validates :first_name, :last_name, :cohort, :city, :state_province, :user_id, presence: true
  belongs_to :user
  attr_accessible :first_name, :last_name, :full_name, :cohort, :phone_number, :address, :address_1, :address_2, :city, :state_province, :postal_code, :country, :latitude, :longitude, :blog, :personal_website, :twitter_handle, :linkedin, :github, :job_status, :entrepreneur, :mentor, :user_id

  geocoded_by :address
  after_validation :populate_full_name
  after_validation :merge_address
  after_validation :geocode, :if => :address_changed?

  private
  
  def merge_address
    self.address = "#{self.address_1} #{self.city} #{self.state_province} #{self.postal_code} #{country}"
  end

  def populate_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def self.search_location(query)
    # put in method to find profiles by distance
    query.nearbys()
    # call method to drop pins on map
  end

  def self.search_name(query)
    # method that finds profiles by name
    where('full_name LIKE ?', "%#{query.gsub(/ /, '%')}%")
    # call method to drop pins on map
  end

  def mentor?
    self.mentor == 'mentor'
  end

  def alumnus?
    self.user.role == 'alumnus'
  end

end
