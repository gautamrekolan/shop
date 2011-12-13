class Category
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String

  validates :title, :description, :presence => true

  has_many :products
  
end
