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
      page.has_selector?('h1', :content => "Alle Bestellungen")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Bestellungen | BERNER-Bikes.com")
    end
  end

  describe "GET 'new'" do
    describe "failure"do
      it "should not be successful without items in cart" do
        get 'new'
        response.should_not be_success
      end
      it "should redirect to homepage without items in cart" do
        get 'new'
        response.should redirect_to(root_url)
      end
    end


  end

end