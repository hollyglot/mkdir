class DirectoryController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @students = Student.all
    @profiles = grab_all_linkedin_info(@students)
  end

end
