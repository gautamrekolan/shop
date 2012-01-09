require 'spec_helper'

describe 'Users' do

  describe "signup" do
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit register_path
          fill_in "Name", :with => ""
          fill_in "Rolle", :with => ""
          fill_in "Passwort", :with => ""
          fill_in "Passwort wiederholen", :with => ""
          click_button
          response.should render_template('new')
          response.should have_selector('div#error_explanation')
        end.should_not change(User, :count)
      end
    end

    describe "success" do
      it "should make a new user" do
        users = User.all
        users.each do |user|
          user.destroy
        end
        lambda do
          visit register_path
          fill_in "Name", :with => "New User"
          fill_in "Rolle", :with => "Customer"
          fill_in "Passwort", :with => "foobar"
          fill_in "Passwort wiederholen", :with => "foobar"
          click_button
        #  response.should redirect_to(root_url)
        end.should change(User, :count).by(1)
      end

    end
  end

end