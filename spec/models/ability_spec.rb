require 'spec_helper'
require 'cancan/matchers'

describe "Ability" do

  describe "as guest" do
  	before(:each) do
      @ability = Ability.new(nil)
    end  
    it "can show a Product" do
      @ability.should be_able_to(:show, Product)
    end
    it "can not view the Products index" do
      @ability.should_not be_able_to(:index, Product)
    end
    it "can manage a Cart" do
    	@ability.should be_able_to(:manage, Cart)
    end
    it "can create an order" do
      @ability.should be_able_to(:create, Order)
    end
    it "can show a Category" do
      @ability.should be_able_to(:show, Category)
    end
     

  end

  describe "as Admin" do
  	before(:each) do
  		@user = Factory(:user)
      @ability = Ability.new(@user)
    end  
  	it "can manage all" do
  		@ability.should be_able_to(:manage, :all)
  	end
  end


  describe "as Customer" do
  	before(:each) do
  		@user = Factory(:user)
  		@user.role = "Customer"
      @ability = Ability.new(@user)
    end  
  	it "can manage products, orders" do
  		@ability.should be_able_to(:read, Order)
  	end
  	it "cannot manage users " do
  		@ability.should_not be_able_to(:manage, User)
    end
    it "cannot create Products" do
      @ability.should_not be_able_to(:create, Product)
    end
    it "cannot destroy Products" do
      @ability.should_not be_able_to(:destroy, Product)
    end
    it "cannot edit products" do
      @ability.should_not be_able_to(:edit, Product)
    end
    it "cannot create partners" do
      @ability.should_not be_able_to(:create, Partner)
    end
    it "cannot destroy,edit partners" do
      @ability.should_not be_able_to(:destroy, Partner)
      @ability.should_not be_able_to(:edit, Partner)
  	end
  end
end