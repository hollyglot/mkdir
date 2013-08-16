class Student < ActiveRecord::Base
  validates :cohort, :city, :state, :postal_code, :user_id, presence: true
  serialize :skills
  belongs_to :user
  attr_accessible :name, :cohort, :phone, :address, :city, :state, :postal_code, :country, :latitude, :longitude, :gmaps, :blog, :website, :twitter, :linkedin, :github, :job_title, :job_status, :entrepreneur, :mentor, :developer_type, :skills, :user_id 

  after_validation :merge_address
  after_validation :populate_name
  after_validation :populate_from_linkedin, :if => :linkedin_changed?
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false

  def category
    return "Student"
  end
  def link_path
    return "students"
  end

  private

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
    "#{self.city} #{self.state_province} #{self.postal_code} #{country}"
  end

  def self.search_name(query)
    # method that finds profiles by name
    where("name LIKE ? ", "%#{query.gsub(/ /, '%')}%")
  end

end
