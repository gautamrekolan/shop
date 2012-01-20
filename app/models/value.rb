class Value 
  include Mongoid::Document
  
  field :content
  embedded_in :option, :inverse_of => :value


end