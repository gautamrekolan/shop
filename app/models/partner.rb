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

  key :title

  has_mongoid_attached_file :image, :styles => { :tile => "220x220" }

end
