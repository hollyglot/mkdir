class User < ActiveRecord::Base
  validates :name, :role, presence: true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :role, :password, :password_confirmation, :remember_me
  
  ROLES = %w[member]
  ADMIN_ROLES = %w[admin]

  def admin?
    ADMIN_ROLES.include? role
  end

  def member?
    ROLES.include? role
  end

end
