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
	  	:status => "noch nicht bearbeitet" }
	end

	it "should validate with the appropriate attributes" do
		Order.create!(@attr)
	end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:pay_type) }
  it { should validate_presence_of(:accept_conditions) }
  
  it { should validate_inclusion_of(:pay_type).to_allow("Vorkasse", "Nachnahme") }
  
  it { should have_field(:zip).of_type(Integer) }
  it { should validate_length_of(:zip).within(3..6) }

  it { should validate_format_of(:email).to_allow("joe@example.com") }
  it { should validate_format_of(:email).not_to_allow("@example.com") }
  it { should validate_format_of(:email).not_to_allow("joe@example") }
  it { should validate_format_of(:email).not_to_allow("joe-example.com") }
  it { should validate_format_of(:email).not_to_allow("joe@") }

  it { should validate_length_of(:first_name).within(2..60) }
  it { should validate_length_of(:last_name).within(2..60) }
  it { should validate_length_of(:street).within(2..60) }
  it { should validate_length_of(:city).within(2..60) }
  it { should validate_length_of(:country).within(2..60) }

  it { should validate_inclusion_of(:status).to_allow("noch nicht bearbeitet", "in Bearbeitung", "versandt") }

  
  # it "should add line_items from cart" do
  # 	product = Factory(:product)
  # 	cart = Cart.new
  # 	line_item = cart.add_product(product.id)
  # 	order = Order.new(@attr)
  #   lambda do
  #     order.add_line_items_from_cart(cart)
  #   end.should change(order.line_items, :count).by(1)
  # end

 
end