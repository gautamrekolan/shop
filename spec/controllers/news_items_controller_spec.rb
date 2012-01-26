require 'spec_helper'

describe NewsItemsController do
  render_views

  describe "GET 'new'" do
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      page.has_selector?('title', :content => "Neue Nachrichtenmeldung | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      page.has_selector?('form', :class => "new_news_item")
    end
    it "should have a label for the news title input" do
      get 'new'
      page.has_selector?('label', :for => "news_item_title")
    end
    it "should have a news title input" do
      get 'new'
      page.has_selector?('input', :id => "news_item_title")
    end
    it "should have a label for the news content input" do  
      get 'new'
      page.has_selector?('label', :for => "news_item_content")
    end
    it "should have an textarea for the content" do
      get 'new'
      page.has_selector?('textarea', :id => "news_item_content" )
    end
    it "should have a label and input for the image input" do
      get 'new'
      page.has_selector?('label', :for => "news_item_image")
      page.has_selector?('input', :id => "news_item_image")
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
      page.has_selector?('h1', :content => "Alle Nachrichten")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Nachrichten")
    end

  end
end