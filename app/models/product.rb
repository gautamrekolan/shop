class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  LIST_ORDER_VALUES = [1,2,3,4,5,6,7,8,9]

 # attr_accessible :title, :description, :price, :image, :category, :_id

  field :title
  field :description
  field :price, :type => Integer
  field :category
  field :list_order, :type => Integer
  key :title

  validates :title, :description, :price, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
  validates :title, :length => {:within => (4..32) }, :uniqueness => true

  has_many :line_items
  has_many :orders
  
  embeds_many :options, :cascade_callbacks => true
  accepts_nested_attributes_for :options, :allow_destroy => true
  
  embeds_many :product_images, :cascade_callbacks => true, :validate => true
  accepts_nested_attributes_for :product_images, :allow_destroy => true
  validates_associated :product_images

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
