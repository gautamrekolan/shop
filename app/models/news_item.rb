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

  validates :title, :length => {:maximum => 50}, :presence => true
  validates :content, :presence => true
  has_mongoid_attached_file :image, :styles => { :full => "960x540#", :box => "160x92#", :thumb => "130x80#" }


end
