require 'spec_helper'
require 'cancan/matchers'

describe "Ability" do

  describe "as guest" do
  	before(:each) do
      @ability = Ability.new(nil)
    end  
    it "can only read a Product" do
      @ability.should be_able_to(:read, :products)
    end
    it "can manage a Cart" do
    	@ability.should be_able_to(:manage, Cart)
    end
    it "cannot edit, destroy, create a Product" do
    	@ability.should_not be_able_to(:edit, Product)
    	@ability.should_not be_able_to(:destroy, Product)
    	@ability.should_not be_able_to(:create, Product)
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


  describe "as Shop Admin" do
  	before(:each) do
  		@user = Factory(:user)
  		@user.role = "Shop Admin"
      @ability = Ability.new(@user)
    end  
  	it "can manage products, orders" do
  		@ability.should be_able_to(:manage, Product)
  		@ability.should be_able_to(:manage, Order)
  		@ability.should be_able_to(:manage, Partner)
  		@ability.should be_able_to(:manage, NewsItem)
  		@ability.should be_able_to(:manage, Category)
  	end
  	it "cannot manage users" do
  		@ability.should_not be_able_to(:manage, User)
  	end
  end
end