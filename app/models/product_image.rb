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
    :bucket         => 'berner-images',
#    :s3_endpoint    => "s3-eu-west-1.amazonaws.com",
    :s3_credentials => {
      :access_key_id => 'AKIAIVEBIFJ6FQGLR35Q',
      :secret_access_key => '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'
    },
    :styles => { 
      :full => "970x520#", 
      :product => "520x520#", 
      :tile => "323x233#", 
      :thumb => "120x80#" 
    }

end
