require 'spec_helper'

describe PagesController do
  render_views
 
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      page.has_selector?('title', :content => "Home | BERNER-Bikes.com")
    end

    it "should have a quicklinks section" do
      get 'home'
      page.has_selector?('section', :id => "quicklinks")
    end
    it "should have a internal_links section" do
      get'home'
      page.has_selector?('section', :id => "internal_adds")
    end
    it "should have a news section" do
      get 'home'
      page.has_selector?('section', :id => "news")
    end
    it "should have a partners section" do
      get 'home'
      page.has_selector?('section', :id => "partners")
    end
    it "should have a menu nav" do
      get 'home'
      page.has_selector?('nav', :class => "menu")
    end
    it "should have a footer" do
      get 'home'
      page.has_selector?('footer', :id => "footer")
    end
  end

  describe "GET 'impressum'" do
    it "should be successful" do
      get 'impressum'
      response.should be_success
    end

    it "should have the right title" do
      get 'impressum'
      page.has_selector?('title', :content => "Impressum | BERNER-Bikes.com")
    end
  end

  describe "GET 'agb'" do
    it "should be successful" do
      get 'agb'
      response.should be_success
    end

    it "should have the right title" do
      get 'agb'
      page.has_selector?('title', :content => "AGB | BERNER-Bikes.com")
    end
  end

end
