require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do
    it "should be a success" do
      get :new
      response.should be_success
    end
    it "should have the right title" do
      get :new
      page.has_selector?("title", :content => "Login | BERNER-Bikes.com")
    end
  end

  describe "POST 'create'" do
    describe " invalid signin" do
      before(:each) do
        @attr = { :email => "User@Name", :password => "invalid" }
      end

      it "should render the home page" do
        post :create, :session => @attr
        response.should redirect_to(root_url)
      end
      it "should have the right title" do
        post :create, :session => @attr 
        page.has_selector?("title", :content => "Login | BERNER-Bikes.com")
      end
    end
    describe "with valid name and password" do

      it "should sign the user in" do
        user = Factory(:user)
        session[:user_id] = user.id
        response.should be_success
      end

      

    end

  end
end