class DirectoryController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  
  include DirectoryHelper

  def index
    @students = Student.all
    @profiles = grab_all_linkedin_info(@students)
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
