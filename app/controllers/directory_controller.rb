class DirectoryController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  
  include DirectoryHelper


  def index

    @students = Student.all
    @mentors = Mentor.all
    @people = @students + @mentors
    grab_all_linkedin_info(@people)
    @json = @people.to_gmaps4rails do |person, marker|
      marker.infowindow "
      <a href=\"/students/#{person.id}\"><img src=\"#{person.pic}\" height=\"60\" width=\"60\" align=\"left\" style=\"margin-right:15px\">
        <h4>
          #{person.name}
        </h4>
      </a>
      <p style=\"margin-top:-5px\"> #{person.developer_type}
      </p>"
    end
    


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

end
