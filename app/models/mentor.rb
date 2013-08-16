class Mentor < ActiveRecord::Base
  validates :city, :state, :postal_code, :user_id, presence: true
  serialize :skills
  attr_accessible :address, :blog, :city, :country, :developer_type, :github, :gmaps, :latitude, :linkedin, :longitude, :name, :phone, :postal_code, :state, :twitter, :user_id, :website 

  belongs_to :user
  after_validation :merge_address
  after_validation :populate_name
  after_validation :populate_from_linkedin, :if => :linkedin_changed?
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false


  def category
    return "Mentor"
  end

  private

  # Populates mentor name
  def populate_name
    self.name = self.user.name
  end

  def merge_address
    self.address = "#{self.city} #{self.state} #{self.postal_code} #{country}"
  end

  def populate_from_linkedin
    if self.linkedin?
      profile = Linkedin::Profile.get_profile(self.linkedin)
      self.skills = profile.skills
      self.job_title = profile.title
    end
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
