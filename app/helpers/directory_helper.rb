module DirectoryHelper

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
