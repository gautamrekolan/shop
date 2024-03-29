require 'spec_helper'

describe UsersController do
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
      page.has_selector?('title', :content => "Neuer Benutzer | BERNER-Bikes.com")
    end
    it "should have the right form" do
      get 'new'
      page.has_selector?('form', :class => "new_user")
    end
    it "should have a label and input for the name" do
      get 'new'
      page.has_selector?('label', :for => "user_name")
      page.has_selector?('input', :id => "user_name")
    end
    it "should have a label and input for the password" do  
      get 'new'
      page.has_selector?('label', :for => "user_password")
      page.has_selector?('input', :id => "user_password" )
    end
    it "should have a label and selector for the role" do
      get 'new'
      page.has_selector?('select')
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
      page.has_selector?('h1', :content => "Alle Benutzer")
    end
    it "should have the right title" do
      get 'index'
      page.has_selector?('title', :content => "Alle Benutzer | BERNER-Bikes.com")
    end

  end

  describe "POST 'create'" do
    describe "failure" do
      
      before(:each) do
        user = Factory(:user)
        session[:user_id] = user.id
        @attr = { :name => "", :email => "", :role => "", :password => "", :password_confirmation => "" }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      it "should have the right title" do
        post :create, :user => @attr
        page.has_selector?('title', :content => "Neuer Benutzer | BERNER-Bikes.com") 
      end
      it "should render the new page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

    end

    describe "success" do
      before(:each) do

        @attr = { :name => "New User", :email => "joe@sample.com", :role => "Admin", :password => "foobar", :password_confirmation => "foobar" }
        users = User.all
        users.each do |user|
          user.destroy
        end
        user = Factory(:user)
        session[:user_id] = user.id
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :user => @attr
        response.should redirect_to(root_url)
      end

    end

  end
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user) 
      user = Factory(:user)
      session[:user_id] = user.id
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    it "should get the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    it "should have the right title" do
      get :show, :id => @user
      title = @user.name + ' | BERNER-Bikes.com' 
      page.has_selector?("title", :content => title)
    end

  end

end