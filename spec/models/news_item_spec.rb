require "spec_helper"

describe NewsItem do
  before(:each) do
  	@attr = { :title => "Title", :content => "Content" }
  end

  it "should create instance given appropriate attributes" do
  	NewsItem.create!(@attr)
  end

  it "should require a title" do
    no_title_news_item = NewsItem.new(@attr.merge(:title => ""))
    no_title_news_item.should_not be_valid
  end
  it "should require content" do
  	no_content_news_item = NewsItem.new(@attr.merge(:content => ""))
  	no_content_news_item.should_not be_valid
  end

  it "should not have a too long title" do
  	long_title = "a" * 51
  	long_title_news_item = NewsItem.new(@attr.merge(:title => long_title))
  	long_title_news_item.should_not be_valid
  end
end