class PartnersController < ApplicationController
  authorize_resource
  # GET /partners
  # GET /partners.json
  def index
    @title = "Alle Partner"
    @partners = Partner.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partners }
    end
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
    @partner = Partner.find(param[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partner }
    end
  end

  # GET /partners/new
  # GET /partners/new.json
  def new
    @title = "Neuer Partner"
    @partner = Partner.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partner }
    end
  end

  # GET /partners/1/edit
  def edit
    @partner = Partner.find(params[:id])
    @title = "Partner " + @partner.title + " bearbeiten"
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(params[:partner])
    @title = "Neuer Partner"
    respond_to do |format|
      if @partner.save
        format.html { redirect_to root_url, notice: 'Partner was successfully created.' }
        format.json { render json: @partner, status: :created, location: @partner }
      else
        format.html { render action: "new" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partners/1
  # PUT /partners/1.json
  def update
    @partner = Partner.find(params[:id])
    @title = "Partner " + @partner.title + " bearbeiten"

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        format.html { redirect_to root_url, notice: 'Partner was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
