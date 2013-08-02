class Admin < User
  default_scope {where(role: User::ADMIN_ROLES)}
end
