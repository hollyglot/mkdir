class HiringPartner < ActiveRecord::Base
  validates :linkedin, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :gmaps, :latitude, :linkedin, :linkedin_info, :longitude

  after_validation :merge_address
  after_validation :populate_name
  before_save :populate_linkedin_info
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

  def populate_linkedin_info
    if self.linkedin?
      self.linkedin = Linkedin::Profile.get_profile(self.linkedin)
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
