class Category
  include Mongoid::Document
  field :title
  field :description
  key :title
  
  validates :title, :description, :presence => true


  has_many :products

end
