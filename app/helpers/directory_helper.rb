module DirectoryHelper
  # def google_maps_api_key
  #   "AIzaSyByTyVeMDxZZLkowFTXjVOO7cf8JRtHJdQ"
  # end
  # def google_api_url
  #   "http://maps.googleapis.com/maps/api/js"
  # end
  # def google_api_access
  #   "#{google_api_url}?key=#{google_maps_api_key}&libraries=geometry&sensor=false"
  # end
  # def google_maps_api
  #   content_tag(:script,:type => "text/javascript",:src => google_api_access) do
  #   end
  # end

  def grab_linkedin_info(student) 
    if student.linkedin?
      Linkedin::Profile.get_profile(student.linkedin)
    end
  end

  def grab_all_linkedin_info(students)
    profiles = {}
    students.each do |s|
      if s.linkedin?
        profiles[s.id] = grab_linkedin_info(s)
      end
    end
    return profiles
  end

end
