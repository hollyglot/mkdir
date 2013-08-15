class DirectoryController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  
  include DirectoryHelper


  def index

    @students = Student.all
    @mentors = Mentor.all
    @people = @students + @mentors
    grab_all_linkedin_info(@people)
  end
    
  def search_name
    # params[:per_page] ||= 10
    # params[:page]     ||= 1

    @students = Student.search_name(params[:search_name])
    @profiles = grab_all_linkedin_info(@students)

    render 'index'
  end

  def search_location
    # params[:per_page] ||= 10
    # params[:page]     ||= 1

    s = Student.search_attributes(params[:user_attribute])
    @students = s.near(params[:search_location], params[:radius], :order => :distance)
    @profiles = grab_all_linkedin_info(@students)
    
    render 'index'

  end

  private

  def grab_linkedin_info(user) 
    if user.linkedin?
      Linkedin::Profile.get_profile(user.linkedin)
    end
  end

  def grab_all_linkedin_info(users)
    users.each do |user|
      if user.linkedin? 
        user.linkedin_info = grab_linkedin_info(user)
        user.pic = user.linkedin_info.picture
      else
        user.pic = ""
      end
    end
  end
end
