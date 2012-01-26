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
      page.has_selector?('title', :content => "Neue Kategorie | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      page.has_selector?('form', :class => "new_category")
    end
    it "should have a title input and label" do
      get 'new'
      page.has_selector?('label', :for => "category_title")
      page.has_selector?('input', :id => "category_title")
    end
    it "should have a description textarea and label" do  
      get 'new'
      page.has_selector?('label', :for => "category_description")
      page.has_selector?('textarea', :id => "category_description" )
    end
  
    it "should have a submit button" do
      get 'new'
      page.has_selector?('input', :type => "submit")
    end

  end

  describe "GET 'index'" do

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
      page.has_selector?('h1', :content => "Alle Kategorien")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Kategorien")
    end

  end
end