class OrdersController < ApplicationController
  
  authorize_resource

  # GET /orders
  # GET /orders.json

  def index
    @title = "Alle Bestellungen"
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @cart = current_cart
    @title = 'Bestellung von ' + @order.first_name + ' ' + @order.last_name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @title = "Ihre Bestellung"
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url, :notice => "Ihr Warenkorb ist leer"
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @cart = current_cart
    @title = 'Bestellung von ' + @order.first_name + ' ' + @order.last_name + ' bearbeiten'

  end

  # POST /orders
  # POST /orders.json
  def create
    @cart = Cart.find(session[:cart_id])
    @order = Order.new(params[:order])
    user = User.new
    user.create_user_out_of_order(@order)
   
    respond_to do |format|
      if @order.save && user.save
        line_items = LineItem.where(cart_id: @cart.id)
        line_items.each do |item|
          item.update_attribute(:order_id, @order.id)
          item.unset(:cart_id)
        end
        @cart.destroy
        session[:cart_id] = nil
        UserMailer.order_notifier(@order).deliver
        format.html { redirect_to(root_url, :notice => "Vielen Dank fuer Ihre Bestellung!" ) }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @title = 'Bestellung von ' + @order.first_name + ' ' + @order.last_name + ' bearbeiten'

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to orders_url, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end

end
