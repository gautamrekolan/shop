class ApplicationController < ActionController::Base
  protect_from_forgery
  
  $categories = Category.all
  $products = Product.all
  $partners = Partner.all
  $news_items = NewsItem.published.order_by([:created_at, :desc]).limit(6)
  


  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue Mongoid::Errors::InvalidFind
      cart = Cart.create
      session[:cart_id] = cart.id
      cart  
    end

  
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  helper_method :current_user

end
