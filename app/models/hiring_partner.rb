class HiringPartner < ActiveRecord::Base
  validates :linkedin, :user_id, presence: true
  belongs_to :user
  attr_accessible :address, :city, :state, :name, :gmaps, :latitude, :linkedin, :longitude, :website, :user_id

  after_validation :populate_from_linkedin, :if => :linkedin_changed?
  before_save :geocode, :if => :address_changed?
  geocoded_by :address

  acts_as_gmappable :process_geocoding => false

  def category
    return "Hiring Partner"
  end

  private 

  def populate_from_linkedin
    profile = Linkedin::Profile.get_profile(self.linkedin)

    profile.current_companies.each do |company|

      if company[:current_company] = self.name
          unless company[:address].nil?
            address = company[:address]
            self.state = Geocoder.search(address).first.state
            self.city = Geocoder.search(address).first.city
            self.address = address
          end
          self.website = company[:website]
      end
    end
  end

  def gmaps4rails_address
    "#{self.address}"
  end

  def self.search_name(query)
    # method that finds profiles by name
    where("company_name LIKE ? ", "%#{query.gsub(/ /, '%')}%")
  end
end