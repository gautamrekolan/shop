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

  def title
    base_title = "BERNER-Bikes.com"
    if @title 
      @title + " | " + base_title
    else
      base_title
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => "remove item")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  
end
