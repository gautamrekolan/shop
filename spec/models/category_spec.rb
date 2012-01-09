require "spec_helper"

describe Category do

  before(:each) do
  	@attr = { :title => "Title", :description => "Description" }
  end

  it "should create an instance given appropriate attributes" do
    Category.create!(@attr)
  end

  it "should not accept long titles" do
  	long_title = "a" * 13
    long_title_category = Category.new(@attr.merge(:title => long_title))
    long_title_category.should_not be_valid
  end

  it "requires a title" do
    no_title_category = Category.new(@attr.merge(:title => ""))
    no_title_category.should_not be_valid
  end


end