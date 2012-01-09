require 'spec_helper'

describe OrdersController do
  render_views
  
  describe "GET 'index'" do

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have the right header" do
      get 'index'
      response.should have_selector('h1', :content => "Alle Bestellungen")
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "Alle Bestellungen | BERNER-Bikes.com")
    end

  end

end