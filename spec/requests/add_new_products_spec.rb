require 'spec_helper'

describe "AddNewProducts", :js => true do
  it "has the admin log in and add a new product" do
    user = Factory(:user)
    category = Factory(:category)

    visit root_path
    click_link 'login'
    fill_in 'name', with: user.name
    fill_in 'password', with: user.password
    click_button 'login'
    current_path.should eq(root_path)
    visit new_product_path
    fill_in 'product_title', with: "Title"
    fill_in 'product_description', with: 'description'
    select category.title, from: 'product_category'
    click_link 'neue Option'
    fill_in 'Option', with: 'Option'
    fill_in 'Werte', with: 'Wert'
    fill_in 'product_price', with: '1'
    click_link 'neues Bild'
    attach_file('Bild', '/Users/ejpres/Rails/shop/spec/support/circle.png')
    click_button 'save'
    current_path.should eq('/products/title')
    page.should have_content('erstellt')
  end
end