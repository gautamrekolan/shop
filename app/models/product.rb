class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  field :title
  field :description
  field :price, :type => Integer
  field :image 

  has_mongoid_attached_file :image, :styles => { :full => "960x540#", :tile => "320x180#", :thumb => "130x80#" }
  embeds_many :product_images
  accepts_nested_attributes_for :product_image


  key :title
end
