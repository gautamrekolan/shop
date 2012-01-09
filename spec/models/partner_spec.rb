require 'spec_helper'

describe Partner do
  before(:each) do
  	@attr = { :title => "Partner", :image => "Partner.png", :link => "www.partner.de"}
  end

  it "should create an instance given appropriate attributes" do
    Partner.create!(@attr)
  end
  it "requires a title" do
    no_title_partner = Partner.new(@attr.merge( :title => '' ))
    no_title_partner.should_not be_valid
  end
  it "requires a link" do
  	no_link_partner = Partner.new(@attr.merge( :link => '' ))
  	no_link_partner.should_not be_valid
  end

end