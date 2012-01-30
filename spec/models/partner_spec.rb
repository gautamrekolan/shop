require 'spec_helper'

describe Partner do
  before(:each) do
  	@attr = { :title => "Partner", :image => "Partner.png", :link => "www.partner.de"}
  end

  it "should create an instance given appropriate attributes" do
    Partner.create!(@attr)
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:image) }
end