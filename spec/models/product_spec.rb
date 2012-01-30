require 'spec_helper'

describe Product do
  before(:each) do
  	@attr = { 	:title => "Product", :description => "Beschriebung", :price => 1 }
  end

  it "should be valid given the right attributes" do
  	Product.create!(@attr)
  end

  it { should embed_many(:product_images) }
  it { should embed_many(:options) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).within(4..22) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).greater_than(0) }

end