require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Impressum page at '/impressum'" do
    get '/impressum'
    response.should have_selector('title', :content => "Impressum")
  end

  it "should have an AGB page at '/AGB'" do
    get '/agb'
    response.should have_selector('title', :content => "AGB")
  end
end