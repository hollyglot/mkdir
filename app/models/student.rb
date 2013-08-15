class Student < ActiveRecord::Base
  validates :cohort, :city, :state, :postal_code, :user_id, presence: true
  belongs_to :user
  attr_accessible :name, :cohort, :phone, :address, :city, :state, :postal_code, :country, :latitude, :longitude, :blog, :website, :twitter, :linkedin, :github, :job_status, :entrepreneur, :mentor, :developer_type, :user_id
  attr_accessor :linkedin_info
  attr_accessor :pic  

  after_validation :merge_address
  after_validation :populate_name
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false

  private

  def populate_name
    self.name = self.user.name
  end

  def merge_address
    self.address = "#{self.city} #{self.state} #{self.postal_code} #{country}"
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
