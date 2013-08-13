module ApplicationHelper
  # Returns the String markup for a Gravatar profile image.
  def profile_image_for_user(user)
    image_tag Gravatar.new(user.email).image_url, class: 'user.pic'
  end
end
