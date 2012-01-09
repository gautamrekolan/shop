require 'spec_helper'

describe CategoriesController do
  render_views

  describe "GET 'new'" do
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "Neue Kategorie | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      response.should have_selector('form', :class => "new_category")
    end
    it "should have a title input and label" do
      get 'new'
      response.should have_selector('label', :for => "category_title")
      response.should have_selector('input', :id => "category_title")
    end
    it "should have a description textarea and label" do  
      get 'new'
      response.should have_selector('label', :for => "category_description")
      response.should have_selector('textarea', :id => "category_description" )
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
      response.should have_selector('h1', :content => "Alle Kategorien")
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "Alle Kategorien")
    end

  end
end