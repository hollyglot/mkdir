class HiringPartnersController < ApplicationController
  # GET /hiring_partners
  # GET /hiring_partners.json
  def index
    @hiring_partners = HiringPartner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hiring_partners }
    end
  end

  # GET /hiring_partners/1
  # GET /hiring_partners/1.json
  def show
    @hiring_partner = HiringPartner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hiring_partner }
    end
  end

  # GET /hiring_partners/new
  # GET /hiring_partners/new.json
  def new
    @hiring_partner = HiringPartner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hiring_partner }
    end
  end

  # GET /hiring_partners/1/edit
  def edit
    @hiring_partner = HiringPartner.find(params[:id])
  end

  # POST /hiring_partners
  # POST /hiring_partners.json
  def create
    @hiring_partner = HiringPartner.new(params[:hiring_partner])

    respond_to do |format|
      if @hiring_partner.save
        format.html { redirect_to @hiring_partner, notice: 'Hiring partner was successfully created.' }
        format.json { render json: @hiring_partner, status: :created, location: @hiring_partner }
      else
        format.html { render action: "new" }
        format.json { render json: @hiring_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hiring_partners/1
  # PUT /hiring_partners/1.json
  def update
    @hiring_partner = HiringPartner.find(params[:id])

    respond_to do |format|
      if @hiring_partner.update_attributes(params[:hiring_partner])
        format.html { redirect_to @hiring_partner, notice: 'Hiring partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hiring_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hiring_partners/1
  # DELETE /hiring_partners/1.json
  def destroy
    @hiring_partner = HiringPartner.find(params[:id])
    @hiring_partner.destroy

    respond_to do |format|
      format.html { redirect_to hiring_partners_url }
      format.json { head :no_content }
    end
  end
end
