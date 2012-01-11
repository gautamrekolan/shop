class Option
  include Mongoid::Document
  
  field :name

  validate :name, :presence => true

  embedded_in :product, :inverse_of => :option


end