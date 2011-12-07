class Product
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String
  field :price, :type => Decimal
  field :image, :type => String
end
