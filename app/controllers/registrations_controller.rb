class RegistrationsController < Devise::RegistrationsController

  def new
    raise CanCan::AccessDenied
  end

end