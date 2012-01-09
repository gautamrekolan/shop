require 'spec_helper'

describe PartnersController do
  render_views

  describe "GET 'new'" do
  	
  	it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "Neuer Partner | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      response.should have_selector('form', :class => "new_partner")
    end
    it "should have a title label and input" do
      get 'new'
      response.should have_selector('label', :for => "partner_title")
      response.should have_selector('input', :id => "partner_title")
    end
    it "should have a link label and input" do  
      get 'new'
      response.should have_selector('label', :for => "partner_link")
      response.should have_selector('input', :id => "partner_link" )
    end
    it "should have a label and input for the image input" do
      get 'new'
      response.should have_selector('label', :for => "partner_image")
      response.should have_selector('input', :id => "partner_image")
    end
    it "should have a submit button" do
      get 'new'
      response.should have_selector('input', :type => "submit")
    end

  end

  describe "GET 'index'" do

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have a table" do
      get 'index'
      response.should have_selector('table')
    end

    it "should have the right header" do
      get 'index'
      response.should have_selector('h1', :content => "Alle Partner")
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "Alle Partner")
    end

  end

end