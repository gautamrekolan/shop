require 'spec_helper'

describe PartnersController do
  render_views

  describe "GET 'new'" do
  	before(:each) do
      user = Factory(:user)
      session[:user_id] = user.id
    end

  	it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      page.has_selector?('title', :content => "Neuer Partner | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      page.has_selector?('form', :class => "new_partner")
    end
    it "should have a title label and input" do
      get 'new'
      page.has_selector?('label', :for => "partner_title")
      page.has_selector?('input', :id => "partner_title")
    end
    it "should have a link label and input" do  
      get 'new'
      page.has_selector?('label', :for => "partner_link")
      page.has_selector?('input', :id => "partner_link" )
    end
    it "should have a label and input for the image input" do
      get 'new'
      page.has_selector?('label', :for => "partner_image")
      page.has_selector?('input', :id => "partner_image")
    end
    it "should have a submit button" do
      get 'new'
      page.has_selector?('input', :type => "submit")
    end

  end

  describe "GET 'index'" do
    before(:each) do
      user = Factory(:user)
      session[:user_id] = user.id
    end
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have a table" do
      get 'index'
      page.has_selector?('table')
    end

    it "should have the right header" do
      get 'index'
      page.has_selector?('h1', :content => "Alle Partner")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Partner")
    end

  end

end