class DirectoryController < ApplicationController
  skip_authorization_check

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
