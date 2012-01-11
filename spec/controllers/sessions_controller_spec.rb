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
      response.should have_selector("title", :content => "Login | BERNER-Bikes.com")
    end
  end

  describe "POST 'create'" do
    describe " invalid signin" do
      before(:each) do
        @attr = { :name => "User Name", :password => "invalid" }
      end

      it "should re-render the signin page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      it "should have the right title" do
        post :create, :session => @attr 
        response.should have_selector("title", :content => "Login | BERNER-Bikes.com")
      end
    end
    describe "with valid name and password" do
      before(:each) do
        @user = Factory(:user) #define user with Factory Girl
        @attr = { :name => @user.name, :password => @user.password }
      end

      it "should sign the user in" do
        post :create, :session => @attr  
        response.should be_success
      end

      it "should redirect to the home page"
      #   post :create, :session => @attr
      #   response.should redirect_to(root_url)
      # end

    end

  end
end