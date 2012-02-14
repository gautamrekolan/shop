class ProductsController < ApplicationController
  authorize_resource
  # GET /products
  # GET /products.json
  def index
    @title = "Alle Produkte"
    @category = params[:view]
    if @category != nil
      @products = Product.where(:category => @category).asc(:released_at, :list_order)
    else
      @products = Product.all.asc(:list_order)
    end
    @categories = Category.all
    @cart = current_cart
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @line_item = @product.line_items.build
    @title = @product.title
    
    #flash[:success] =  "hallo"
    respond_to do |format|
      format.html 
      format.js 
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new  
    @title = "Neues Produkt erstellen"
    @product = Product.new 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @title = @product.title + " bearbeiten"
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @title = "Neues Produkt erstellen"

    respond_to do |format|
      if @product.save
        if @product.product_images.count == 1
          @product.product_images.where(:title_image => false).update(title_image: true)
        end
        format.html { redirect_to @product, notice: 'Neues Produkt wurde erstellt.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @title = @product.title + " bearbeiten"

    id = @product.id
    respond_to do |format|
      if (@product.update_attributes(params[:product]) && @product._id = id)
        format.html { redirect_to products_path, notice: 'Produkt wurde bearbeitet.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end
  
  def product_pop_image
    @product = Product.find(params[:id])

    @pop_image = @product.product_images.find(params[:image_id])

    respond_to do |format|
      format.js
      format.html
    end
  end
  
end
