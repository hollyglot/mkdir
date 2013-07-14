class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :status, :password, :password_confirmation, :remember_me
  
  ROLES = %w[admin student hiring]

  def is?(role)
    roles.include?(role.to_s)
  end

  def admin?
    current_user.role == 'admin'
  end

  def student?
    current_user.role == 'student'
  end

  def hiring?
    current_user.role == 'hiring'
  end

end
