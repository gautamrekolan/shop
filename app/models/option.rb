class Option
  include Mongoid::Document
  
  field :name
  embedded_in :product, :inverse_of => :option

  embeds_many :values
  accepts_nested_attributes_for :values, :reject_if => lambda{ |a| a[:content].blank? }, :allow_destroy => true
end