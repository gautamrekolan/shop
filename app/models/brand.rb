class Brand
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes
  
  attr_accessible :title, :image, :link

  field :title
  field :image

  validates :title, :presence => true
  validates :image, :presence => true

  key :title

  has_mongoid_attached_file :image, 
    :styles => { :tile => "x24" },
    :path           => ':attachment/:id/:style.:extension',
    :storage        => :s3,
    :bucket         => Rails.env.production? ? "berner-images" : "#{Rails.env}-berner-images",    
    :s3_credentials => S3_CREDENTIALS
end
