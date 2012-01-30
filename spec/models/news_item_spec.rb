require "spec_helper"

describe NewsItem do
  before(:each) do
  	@attr = { :title => "Title", :content => "Content" }
  end

  it "should create instance given appropriate attributes" do
  	NewsItem.create!(@attr)
  end
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:title).within(5..50) }

end