class ProductImage
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  attr_accessible :image, :title_image
  field :image
  field :title_image, :type => Boolean

  validates :image, :presence => true

  embedded_in :product, :inverse_of => :product_images

  has_mongoid_attached_file :image, :styles => { :full => "970x520#", :product => "520x520#", :tile => "323x233#", :thumb => "120x80#" }

end
