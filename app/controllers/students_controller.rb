class StudentsController < ApplicationController

  include StudentsHelper

  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /studentsn
  # GET /students.json
  # When you do the search the fields will come through in a query .. check if params name is present then filter students...

# if params[:name].present?
#   @students = @students.where("name like '?%'", params[:name])
# end

# render only the results section if the request is coming from JS
# if request.xhr?
#   render 'search_results'
# end

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

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @profile = grab_linkedin_info(@student)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
