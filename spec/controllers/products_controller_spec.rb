require 'spec_helper'

describe ProductsController do
  render_views

  describe "GET 'new'" do
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "Neues Produkt | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      response.should have_selector('form', :class => "new_product")
    end
    it "should have a label and input for the title" do
      get 'new'
      response.should have_selector('label', :for => "product_title")
      response.should have_selector('input', :id => "product_title")
    end
    it "should have a label and input for the description" do  
      get 'new'
      response.should have_selector('label', :for => "product_description")
      response.should have_selector('textarea', :id => "product_description" )
    end
    it "should have a label and input for the image" do
      get 'new'
      response.should have_selector('label', :for => "product_image")
      response.should have_selector('input', :id => "product_image")
    end
    it "should have a label and select button for the category" do
      get 'new'
      response.should have_selector('label', :for => "product_category")
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

    it "should have the right header" do
      get 'index'
      response.should have_selector('h1', :content => "Alle Produkte")
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "Alle Produkte")
    end

  end

end