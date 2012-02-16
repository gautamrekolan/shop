class ProductImage
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  attr_accessible :image, :title_image
  field :image
  field :title_image, :type => Boolean

  validates :image, :presence => true

  embedded_in :product, :inverse_of => :product_images

  has_mongoid_attached_file :image, 
    :path           => ':attachment/:id/:style.:extension',
    :storage        => :s3,
    :bucket         => Rails.env.production? ? "berner-images" : "#{Rails.env}-berner-images",
    :s3_credentials => S3_CREDENTIALS,
    :styles => { 
      :full => "740x550#", 
      :product => "520x520#", 
      :tile => "323x233#", 
      :thumb => "120x80#" 
    }

end
