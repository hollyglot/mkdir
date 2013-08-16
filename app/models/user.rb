class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :name, :email, :password, :password_confirmation, :remember_me, :role_ids

  after_validation :populate_name
  has_and_belongs_to_many :roles
  has_one :student
  has_one :mentor
  has_one :staff_member
  has_one :hiring_partner

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def populate_name
    self.name = "#{self.first_name} #{self.last_name}"
    if self.student
      self.student.name = self.name
    end
    if self.mentor
      self.mentor.name = self.name
    end
  end
  
end
