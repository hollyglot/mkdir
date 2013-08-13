class Student < ActiveRecord::Base
  validates :cohort, :city, :state_province, :user_id, presence: true
  belongs_to :user
  attr_accessible :cohort, :phone_number, :address, :address_1, :address_2, :city, :state_province, :postal_code, :country, :latitude, :longitude, :blog, :personal_website, :twitter_handle, :linkedin, :github, :job_status, :entrepreneur, :mentor, :user_attributes, :user_id

  after_validation :merge_address
  after_validation :populate_attributes
  after_validation :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable

  private

  def merge_address
    self.address = "#{self.address_1} #{self.city} #{self.state_province} #{self.postal_code} #{country}"
  end

  def gmaps4rails_address
    "#{self.address}"
  end

  def populate_attributes
    self.user_attributes = "#{self.mentor} #{self.entrepreneur}"
  end

  def self.search_name(query)
    # method that finds profiles by name
    where('full_name LIKE ?', "%#{query.gsub(/ /, '%')}%")
    # call method to drop pins on map
  end

  def self.search_attributes(query)
    # method that finds profiles by name
    where('user_attributes LIKE ?', "%#{query.gsub(/ /, '%')}%")
    # call method to drop pins on map
  end

end
