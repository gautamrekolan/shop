class BrandsController < ApplicationController
  authorize_resource
  # GET /brands
  # GET /brands.json
  def index
    @title = "Alle Marken"
    @brands = Brand.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(param[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @title = "Neue Marke"
    @brand = Brand.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
    @title = "Marke " + @brand.title + " bearbeiten"
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])
    @title = "Neue Marke"
    respond_to do |format|
      if @brand.save
        format.html { redirect_to root_url, notice: 'Marke was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])
    @title = "Marke " + @brand.title + " bearbeiten"

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to root_url, notice: 'Marke was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
