class Mentor < ActiveRecord::Base
  validates :city, :state, :postal_code, :user_id, presence: true
  attr_accessible :address, :blog, :city, :country, :developer_type, :github, :gmaps, :latitude, :linkedin, :longitude, :name, :phone, :postal_code, :state, :twitter, :user_id, :website
  attr_accessor :linkedin_info  
  attr_accessor :pic

  belongs_to :user
  after_validation :merge_address
  after_validation :populate_name
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false

  private

  # Populates mentor name
  def populate_name
    self.name = self.user.name
  end

  def merge_address
    self.address = "#{self.city} #{self.state} #{self.postal_code} #{country}"
  end

  def gmaps4rails_address
    # Ideally this should #{self.address}, but the callbacks are causing Student.create not to save because the merge_address method is being called after the acts_as_gmappable.
    "#{self.city} #{self.state} #{self.postal_code} #{country}"
  end

  def self.search_name(query)
    # method that finds profiles by name
    where("name LIKE ? ", "%#{query.gsub(/ /, '%')}%")
  end
end
