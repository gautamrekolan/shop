require 'open-uri'

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
      "#{your_cart.total_number} #{t(:items_in_the_cart)}"
    else
      t(:your_cart_is_empty)
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
  
  def euro_price(price)
    number_to_currency(price, :unit => "&euro;", :separator => ",", :delimiter => "", :format => "%n %u", :strip_insignificant_zeros => true)
  end

  def team_news
    url = "http://team.berner-bikes.com/feed"
    doc = Nokogiri::HTML(open(url))
    items = Array.new
    
    doc.css('entry').each do |item|
      title = item.css('title').text
      link = item.at_css('link')[:href]
      value = {
        :title => title,
        :link => link
      }
      items.push(value)
    end
    items
  end

end
