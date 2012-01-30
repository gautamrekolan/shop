require "spec_helper"

describe Category do

  before(:each) do
  	@attr = { :title => "Title", :description => "Description" }
  end

  it "should create an instance given appropriate attributes" do
    Category.create!(@attr)
  end
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).within(3..12)}
end