class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  PAYMENT_TYPES = ["Vorkasse", "Nachnahme"]
  STATUS_TYPES = ["Steht aus", "In Bearbeitung", "Abgeschlossen"]
  POSTAGE = 5
  POSTAGE_FREE = 50

  field :first_name
  field :last_name
  field :street
  field :zip, :type => Integer
  field :city
  field :country
  field :email
  field :pay_type
  field :status
  field :accept_conditions, :type => Boolean
  field :ticket

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, :street, :zip, :city, :country, :email, :pay_type, :accept_conditions, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :zip, :length => { :within => 3..6 }
  validates :email, :format=> { :with => email_regex }
  validates :first_name, :last_name, :street, :city, :country, :length => { :within => 2..60 }
  validates :status, :inclusion => STATUS_TYPES

  has_many :line_items, :dependent => :destroy


  def postage_price(total_price)
    if total_price >= POSTAGE_FREE
      postage = 0
    else
      postage = POSTAGE
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price } 
  end

  def total_line_items_number
    quantity = 0
    line_items.each do |item|
      quantity += item.quantity
    end
    quantity
  end

end
