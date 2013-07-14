class ApplicationController < ActionController::Base
  protect_from_forgery

  # ensure authorization happens on every action in the application
  check_authorization

  # Action and alert for failed authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end

