require 'spec_helper'

describe "NotifyOnOrders" do
  it "emails user after placing an order" do
    product = Factory(:product)
    visit product_path(product)
    click_button 'buy'
    visit new_order_path
    click_button 'place_order' 
    fill_in "first_name", :with => "Eric"
    fill_in "last_name", :with => "Nordmeyer"
    fill_in "street", with: "Leipziger Str. 5"
    fill_in "zip", with: "44139"
    fill_in "city", with: "Dortmund"
    fill_in "country", with: "Deutschland"
    fill_in "email", with: "eric@nordmeyer.name"
    select "Vorkasse", from: "order_pay_type"
    check "accept_conditions"
    click_button "send_order"
    current_path.should eq(root_path)
    page.should have_content("Vielen Dank")
    last_email.to.should include("eric@nordmeyer.name")        
  end
end
