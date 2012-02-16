require 'spec_helper'

describe "ChangeStatusOfOrder" do

  it "has the admin change the status of orders" do

    user = Factory(:user)
    order = Factory(:order)
    order.status = Order::STATUS_TYPES[0]

    visit root_path
    click_link 'login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'login'
    visit orders_path
    select 'in Bearbeitung', from: 'order_status'
  end
end