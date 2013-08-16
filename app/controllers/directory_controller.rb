class DirectoryController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  

  def index
    @students = Student.all
    @mentors = Mentor.all
    @staff_members = StaffMember.all
    @hiring_partners = HiringPartner.all
    @people = @students + @mentors + @staff_members + @hiring_partners
  end
    
  def search_name
    # params[:per_page] ||= 10
    # params[:page]     ||= 1

    @students = Student.search_name(params[:search_name])
    @mentors = Mentor.search_name(params[:search_name])
    @staff_members = StaffMember.search_name(params[:search_name])
    @hiring_partners = HiringPartner.search_name(params[:search_name])
    @people = @students + @mentors + @staff_members + @hiring_partners

    render 'index'
  end

  def search_location
    # params[:per_page] ||= 10
    # params[:page]     ||= 1

    if params[:category] == 'mentor'
      m = Mentor.where('')
      @people = m.near(params[:search_location], params[:radius], :order => :distance)
    elsif params[:category] == 'student'
      s = Student.where('')
      @people = s.near(params[:search_location], params[:radius], :order => :distance)
    elsif params[:category] == 'staff'
      sm = StaffMember.where('')
      @people = sm.near(params[:search_location], params[:radius], :order => :distance)
    elsif params[:category] == 'hiring'
      h = HiringPartner.where('')
      @people = h.near(params[:search_location], params[:radius], :order => :distance)    
    end
    
    render 'index'

  end

end
