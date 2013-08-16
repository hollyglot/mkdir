class HiringPartner < ActiveRecord::Base
  validates :linkedin, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :company_name, :gmaps, :latitude, :linkedin, :longitude, :website, :user_id

  after_validation :populate_from_linkedin, :if => :linkedin_changed?
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false

  private 

  def populate_from_linkedin
    profile = Linkedin::Profile.get_profile(self.linkedin)
    self.address = profile.current_companies[0][:address]
    self.website = profile.current_companies[0][:website]
    self.company_name = profile.current_companies[0][:current_company]
  end

  def gmaps4rails_address
    # Ideally this should #{self.address}, but the callbacks are causing Student.create not to save because the merge_address method is being called after the acts_as_gmappable.
    "#{self.address}"
  end

  def self.search_name(query)
    # method that finds profiles by name
    where("company_name LIKE ? ", "%#{query.gsub(/ /, '%')}%")
  end
end
