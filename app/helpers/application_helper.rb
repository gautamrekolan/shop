module ApplicationHelper
  
  def your_cart
    Cart.find(session[:cart_id])
  rescue Mongoid::Errors::InvalidFind
    cart = Cart.create
    session[:cart_id] = cart.id
    cart  
  end

  def short_cart_content
    if (your_cart.total_number > 0)
      "#{your_cart.total_number} Artikel im Warenkorb"
    else
      "Ihr Warenkorb ist leer"
    end
  end


end
