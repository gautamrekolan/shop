class ProductImage
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  field :title
  field :pimage
  embedded_in :product, :inverse_of => :product_images

  has_mongoid_attached_file :pimage, :styles => { :full => "960x540#", :thumb => "130x80#" }

end
