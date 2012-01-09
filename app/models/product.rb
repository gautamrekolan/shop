class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::MultiParameterAttributes


  attr_accessible :title, :description, :price, :image, :category, :_id

  field :title
  field :description
  field :price, :type => Integer
  field :image 
  field :category

  key :title

  validates :title, :description, :price, :presence => true

  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :length => {:maximum => 40}, :uniqueness => true

  has_mongoid_attached_file :image, :styles => { :full => "960x540#", :tile => "319x179#", :thumb => "130x80#" }

  has_many :line_items
  has_many :orders
  before_destroy :ensure_not_referenced_by_any_line_item

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else 
        errors.add(:base, 'Line Items present')
        return false
      end
    end
  


end
