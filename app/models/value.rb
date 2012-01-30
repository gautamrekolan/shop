class Value 
  include Mongoid::Document
  
  field :content
  embedded_in :option, :inverse_of => :value

  validates :content, :presence => true

end