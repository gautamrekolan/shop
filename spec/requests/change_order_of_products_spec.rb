require 'spec_helper'

describe "ChangeOrderOfProducts" do

  it "has the admin change the order of Products in lists" do

    user = Factory(:user)
    product = Factory(:product)

    visit root_path
    click_link 'login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'login'
    visit edit_product_path(product)
    select "1", from: 'product_list_order'



  end



end