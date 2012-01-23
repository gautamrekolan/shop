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

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, :street, :number, :zip, :city, :country, :email, :pay_type, :accept_conditions, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :zip, :numericality => { :greater_than => 10000 }, :length => { :is => 5 }
  validates :email, :format=> { :with => email_regex }
  validates :first_name, :length => { :maximum => 60 }
  validates :last_name, :street, :city, :country, :length => { :within => 2..60 }
  validates :status, :inclusion => STATUS_TYPES

  has_many :line_items, :dependent => :destroy

end
