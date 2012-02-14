require 'spec_helper'

describe ProductsController do
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
      page.has_selector?('title', :content => "Neues Produkt | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      page.has_selector?('form', :class => "new_product")
    end
    it "should have a label and input for the title" do
      get 'new'
      page.has_selector?('label', :for => "product_title")
      page.has_selector?('input', :id => "product_title")
    end
    it "should have a label and input for the description" do  
      get 'new'
      page.has_selector?('label', :for => "product_description")
      page.has_selector?('textarea', :id => "product_description" )
    end

    it "should have a label and select button for the category" do
      get 'new'
      page.has_selector?('label', :for => "product_category")
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

    it "should have the right header" do
      get 'index'
      page.has_selector?('h1', :content => "Alle Produkte")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Produkte")
    end

  end

  describe "POST 'create'" do
    describe "failure" do

      before(:each) do
        user = Factory(:user)
        session[:user_id] = user.id
        @attr = { :title => "", :description => "", :price => "", :category => "" }
      end

      it "should not create a product" do
        lambda do
          post :create, :product => @attr
        end.should_not change(Product, :count) 
      end
    end

    describe "success" do  
      before(:each) do
        user = Factory(:user)
        session[:user_id] = user.id
        @attr = { :title => "Title", :description => "Description", :price => "1", :category => "Rahmen" }
      end
      it "should create a product" do
        lambda do
          post :create, :product => @attr
        end.should change(Product, :count).by(1)
      end
    end
  end

  describe "create_option" do
    it "should create a new option"
  end
  

end