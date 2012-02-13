class Cart
  include Mongoid::Document

  has_many :line_items, :dependent => :destroy
  
  # Must be replaced for new organisation of options
  def add_product(product_id)
  	#current_item = line_items.where(product_id: product_id).first

  	# if current_item
  	#   if (current_item.quantity == nil) 
   #      current_item.quantity = 0
   #    end
   #    current_item.quantity = 1
  	# else
  	#   current_item = line_items.build(:product_id => product_id)
   #    current_item.quantity += 1
   #  end
    #current_item
    line_items.create(:product_id => product_id, :quantity => 1)
  end
  #### end

  def count_up_equal_items(product_id, line_item)
    equal_items = LineItem.where(product_id: product_id, options: line_item.options, cart_id: line_item.cart_id)
    # line_item.quantity = equal_item.quantity + 1
    quantity = 1
    equal_items.each do |equal_item|
      quantity += equal_item.quantity
      if equal_item != line_item
        equal_item.delete
      end
    end
    quantity
  end    

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

  def total_number
    line_items.to_a.sum {|item| item.quantity}
  end  
end
