class Partner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes
  
  attr_accessible :title, :image, :link

  field :title
  field :image
  field :link

  validates :title, :presence => true
  validates :link, :presence => true
  validates :image, :presence => true

  key :title

  has_mongoid_attached_file :image, 
    :styles => { :tile => "x40" },
    :path           => ':attachment/:id/:style.:extension',
    :storage        => :s3,
    :bucket         => 'berner-images',
    :s3_credentials => {
      :access_key_id => 'AKIAIVEBIFJ6FQGLR35Q',
      :secret_access_key => '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'
    }

end
