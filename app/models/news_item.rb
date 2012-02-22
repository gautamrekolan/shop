class NewsItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes

  attr_accessible :title, :content, :image, :published
  
  field :title
  field :content
  field :image
  field :published, :type => Boolean
  
  key :title

  scope :published, where(published: true)

  validates :title, :length => {:within => 5..50}, :presence => true
  validates :content, :presence => true
  has_mongoid_attached_file :image, 
    :path           => ':attachment/:id/:style.:extension',
    :storage        => :s3,
    :bucket         => Rails.env.production? ? "berner-images" : "#{Rails.env}-berner-images",
    :s3_credentials => S3_CREDENTIALS,
    :styles => { 
      :full => "970x520#",
      :page => "520x520#", 
      :box => "160x92#", 
      :thumb => "130x80#" 
    }

  def team_news
    "hallo"
  end


end
