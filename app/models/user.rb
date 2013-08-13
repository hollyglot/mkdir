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

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def populate_name
    self.name = "#{self.first_name} #{self.last_name}"
  end

end
