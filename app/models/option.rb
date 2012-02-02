class Option
  include Mongoid::Document
  
  field :name
  field :values
  embedded_in :product, :inverse_of => :option
  
  validates :name, :presence => true
  validates :values, :presence => true

end