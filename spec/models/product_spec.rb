require 'spec_helper'

describe Product do
  before(:each) do
  	@attr = { 	:title => "Product", :description => "Beschriebung", :price => 1 }
  end

  it "should be valid given the right attributes" do
  #	Product.create!(@attr)
  end

  it "requires a title" do
  	no_title_product = Product.new(@attr.merge(:title => ""))
  	no_title_product.should_not be_valid
  end
  it "requires a short enough title"do
    long_title = "a" * 41
    long_title_product = Product.new(@attr.merge(:title => long_title))
    long_title_product.should_not be_valid
  end
  it "requires a description" do
  	no_description_product = Product.new(@attr.merge(:description => ""))
  	no_description_product.should_not be_valid
  end

  it "requires a price" do
  	no_price_product = Product.new(@attr.merge(:price => ""))
  	no_price_product.should_not be_valid
  end

  it "requires a price greater than 0" do
  	zero_price_product = Product.new(@attr.merge(:price => 0))
  	zero_price_product.should_not be_valid
  end

end