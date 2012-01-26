require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    page.has_selector?('title', :content => "Home | BERNER-Bikes.com")
  end

  it "should have a Impressum page at '/impressum'" do
    get '/impressum'
    page.has_selector?('title', :content => "Impressum | BERNER-Bikes.com")
  end

  it "should have an AGB page at '/AGB'" do
    get '/agb'
    page.has_selector?('title', :content => "AGB | BERNER-Bikes.com")
  end
end