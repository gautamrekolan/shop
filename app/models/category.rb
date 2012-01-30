class Category
  include Mongoid::Document
  field :title
  field :description
  key :title
  
  validates :title, :presence => true, :length => { :within => 3..12 }
  validates :description, :presence => true
  

  has_many :products

end
