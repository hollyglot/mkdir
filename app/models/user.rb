class User < ActiveRecord::Base
  validates :name, :role, presence: true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :profile, :role, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :roles
  has_one :student
  
  ROLES = %w[member]
  ADMIN_ROLES = %w[admin]

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def admin?
    ADMIN_ROLES.include? role
  end

  def member?
    ROLES.include? role
  end

end
