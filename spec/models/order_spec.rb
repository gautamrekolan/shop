require 'spec_helper'

describe Order do

  before(:each) do
  	@attr = {:first_name => "Firstname", 
	  	:last_name => "Lastname", 
	  	:street => "Street", 
	  	:number => "Number", 
	  	:zip => "12345", 
	  	:city => "City", 
	  	:country => "Country", 
	  	:email => "joe@example.com",
	  	:pay_type => "Vorkasse",
	  	:accept_conditions => true,
	  	:status => "Steht aus" }
	end

	it "should validate with the appropriate attributes" do
		Order.create!(@attr)
	end

	it "requires a first name" do
		no_first_name_order = Order.new(@attr.merge(:first_name => ""))
		no_first_name_order.should_not be_valid
	end
	it "requires a last name" do
		no_last_name_order = Order.new(@attr.merge(:last_name => ""))
		no_last_name_order.should_not be_valid
	end
	it "requires a Street" do
		no_street_order = Order.new(@attr.merge(:street => ""))
		no_street_order.should_not be_valid
	end
	it "requires a house-number" do
		no_number_order = Order.new(@attr.merge(:number => ""))
		no_number_order.should_not be_valid
	end
	it "requires a zip code" do
		no_zip_order = Order.new(@attr.merge(:zip => ""))
		no_zip_order.should_not be_valid
	end
	it "requires a City" do
		no_city_order = Order.new(@attr.merge(:city => ""))
		no_city_order.should_not be_valid
	end
	it "requires a country" do
		no_country_order = Order.new(@attr.merge(:country => ""))
		no_country_order.should_not be_valid
	end
	it "requires an email address" do
		no_email_order = Order.new(@attr.merge(:email => ""))
		no_email_order.should_not be_valid
	end
	it "requires a pay type" do
		no_pay_type_order = Order.new(@attr.merge(:pay_type => ""))
		no_pay_type_order.should_not be_valid
	end
	it "requires the terms of service to be accepted" do
		no_accept_conditions_order = Order.new(@attr.merge(:accept_conditions => false))
		no_accept_conditions_order.should_not be_valid
	end

	it "requires payment type to be within the offered payment types" do
		wrong_payment_type_order = Order.new(@attr.merge(:pay_type => "Wrong payment type"))
		wrong_payment_type_order.should_not be_valid
	end
	it "requires zip to be a number" do
		non_numerical_zip_order = Order.new(@attr.merge(:zip => "char"))
		non_numerical_zip_order.should_not be_valid
	end
	it "requires zip to be no more than 5 digits" do
		six_digits_zip_order = Order.new(@attr.merge(:zip => "123456"))
		six_digits_zip_order.should_not be_valid
	end
	it "requires zip to be no less than 5 digits" do
		four_digits_zip_order = Order.new(@attr.merge(:zip => "1234"))
		four_digits_zip_order.should_not be_valid
	end
	it "requires an email with correct tld" do
		no_tld_email = Order.new(@attr.merge(:email => "joe@example"))
		no_tld_email.should_not be_valid
	end
	it "requires an @ within the email address" do
		no_at_email = Order.new(@attr.merge(:email => "joeexample.com"))
		no_at_email.should_not be_valid
	end
	it "requires a name before the at" do
		nothing_before_at_email = Order.new(@attr.merge(:email => "@example.com"))
		nothing_before_at_email.should_not be_valid
	end
	it "requires something aftrer the at" do
		nothing_after_the_at_email = Order.new(@attr.merge(:email => "joe@"))
		nothing_after_the_at_email.should_not be_valid
	end
  
  it "requires a first name no longer than 60 char" do
  	long_first_name = "a" * 61
  	long_first_name_order = Order.new(@attr.merge(:first_name => long_first_name))
  	long_first_name_order.should_not be_valid
  end
  it "requires a last name no longer than 60 char" do
  	long_last_name = "a" * 61
  	long_last_name_order = Order.new(@attr.merge(:last_name => long_last_name))
  	long_last_name_order.should_not be_valid
  end
  it "requires a last name longer than 1 char" do
  	short_last_name = "a"
  	short_last_name_order = Order.new(@attr.merge(:last_name => short_last_name))
  	short_last_name_order.should_not be_valid
  end
  it "requires a street no longer than 60 char" do
  	long_street = "a" * 61
  	long_street_order = Order.new(@attr.merge(:street => long_street))
  	long_street_order.should_not be_valid
  end
  it "requires a street longer than 1 char" do
  	short_street = "a"
  	short_street_order = Order.new(@attr.merge(:street => short_street))
  	short_street_order.should_not be_valid
  end

  it "requires a city no longer than 60 char " do
  	long_city = "a" * 61
  	long_city_order = Order.new(@attr.merge(:city => long_city))
  	long_city_order.should_not be_valid
  end
  it "requires a city longer than 1 char" do
  	short_city = "a"
  	short_city_order = Order.new(@attr.merge(:city => short_city))
  	short_city_order.should_not be_valid
  end
  it "requires a country longer than 1 char" do
  	short_country = "a"
  	short_country_order = Order.new(@attr.merge(:country => short_country))
  	short_country_order.should_not be_valid
  end
  it "requires a country no longer than 60 char" do
  	long_country = "a"
  	long_country_order = Order.new(@attr.merge(:country => long_country))
  	long_country_order.should_not be_valid
  end

  it "requires status to be within status types" do
  	wrong_status_type_order = Order.new(@attr.merge(:status => "Wrong Status"))
  	wrong_status_type_order.should_not be_valid
  end
  
  it "should not be valid if TOS ar not accepted" do
  	no_accept_conditions_order = Order.new(@attr.merge(:accept_conditions => false))
    no_accept_conditions_order.should_not be_valid
  end
  
 
end