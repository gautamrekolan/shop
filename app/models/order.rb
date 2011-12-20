class Order
  include Mongoid::Document

  PAYMENT_TYPES = ["Vorkasse", "Nachnahme"]
  STATUS_TYPES = ["Steht aus", "In Bearbeitung", "Abgeschlossen"]

  field :first_name
  field :last_name
  field :street
  field :number
  field :zip, :type => Integer
  field :city
  field :country
  field :email
  field :pay_type
  field :timestamps
  field :status
  field :accept_conditions, :type => Boolean

  validates :first_name, :last_name, :street, :number, :zip, :city, :country, :email, :pay_type, :accept_conditions, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :zip, :numericality => { :greater_than_or_equal_to => 10000 }

  has_many :line_items, :dependent => :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
