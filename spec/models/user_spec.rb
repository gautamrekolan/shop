require "spec_helper"

describe User do


  before(:each) do
    @attr = { :name => "Namessss", :password => "password", :role => "Admin" }
    users = User.all
    users.each do |user|
      user.destroy
    end
  end

  it "should be valid with proper attributes" do
    User.create!(@attr)
  end
  it "requires a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  it "requires a password" do
    no_password_user = User.new(@attr.merge(:password => ""))
    no_password_user.should_not be_valid
  end
  it "should not validate with a short name" do
    short_name = "a" * 3
    short_name_user = User.new(@attr.merge(:name => short_name))
    short_name_user.should_not be_valid
  end
  it "should not validate with long name" do
    long_name = "a" * 61
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  it "should not validate with short password" do
    short_password = "a" * 5
    short_password_user = User.new(@attr.merge(:password => short_password))
    short_password_user.should_not be_valid
  end
  it "should not validate with long password" do
    long_password = "a" * 21
    long_password_user = User.new(@attr.merge(:password => long_password))
    long_password_user.should_not be_valid
  end
  # it "requires a unique name" do
  #   User.create!(@attr)
  #   non_unique_user = User.new(@attr)
  #   non_unique_user.should_not be_valid
  # end

  it "should not validate without a role" do
    no_role_user = User.new(@attr.merge(:role => ""))
    no_role_user.should_not be_valid
  end

  it "requires a role within the prescribed Roles" do
    wrong_role = "Wrong"
    wrong_role_user = User.new(@attr.merge(:role => wrong_role))
    wrong_role_user.should_not be_valid
  end
  


end
