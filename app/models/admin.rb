class Admin < User
  devise :database_authenticatable
  default_scope {where(role: User::ADMIN_ROLES)}
end
