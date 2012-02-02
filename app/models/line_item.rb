class LineItem
  include Mongoid::Document
  
  attr_accessible :product_id, :cart_id, :quantity, :order_id

  field :product_id
  field :cart_id
  field :quantity, :type => Integer
  field :order_id
  field :options, :type => Hash

  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
  	product.price * quantity
  end
end
