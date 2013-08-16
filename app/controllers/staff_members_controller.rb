class StaffMembersController < ApplicationController
  # GET /staff_members
  # GET /staff_members.json
  def index
    @staff_members = StaffMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staff_members }
    end
  end

  # GET /staff_members/1
  # GET /staff_members/1.json
  def show
    @staff_member = StaffMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff_member }
    end
  end

  # GET /staff_members/new
  # GET /staff_members/new.json
  def new
    @staff_member = StaffMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staff_member }
    end
  end

  # GET /staff_members/1/edit
  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  # POST /staff_members
  # POST /staff_members.json
  def create
    @staff_member = StaffMember.new(params[:staff_member])

    respond_to do |format|
      if @staff_member.save
        format.html { redirect_to @staff_member, notice: 'Staff member was successfully created.' }
        format.json { render json: @staff_member, status: :created, location: @staff_member }
      else
        format.html { render action: "new" }
        format.json { render json: @staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staff_members/1
  # PUT /staff_members/1.json
  def update
    @staff_member = StaffMember.find(params[:id])

    respond_to do |format|
      if @staff_member.update_attributes(params[:staff_member])
        format.html { redirect_to @staff_member, notice: 'Staff member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_members/1
  # DELETE /staff_members/1.json
  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy

    respond_to do |format|
      format.html { redirect_to staff_members_url }
      format.json { head :no_content }
    end
  end
end
