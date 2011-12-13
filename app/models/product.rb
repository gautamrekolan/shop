class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  attr_accessible :title, :description, :price, :image

  field :title
  field :description
  field :price, :type => Integer
  field :image 
  field :category

  validates :title, :description, :price, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true

  belongs_to :category

  has_mongoid_attached_file :image, :styles => { :full => "960x540#", :tile => "319x179#", :thumb => "130x80#" }
  embeds_many :product_images
  accepts_nested_attributes_for :product_image


  key :title
end
