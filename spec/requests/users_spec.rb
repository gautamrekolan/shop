require 'spec_helper'

describe 'Users' do

  describe "signup" do

  #
  # there is no registration for non customers at the moment
  #
  #   describe "failure" do
  #     it "should not make a new user" do
  #       lambda do
  #         visit register_path
  #         fill_in "Name", :with => ""
  #         fill_in "EMail", :with => ""
  #         select "", :from => "Rolle"
  #         fill_in "Passwort", :with => ""
  #         fill_in "Passwort wiederholen", :with => ""
  #         click_button('Speichern')
  #         page.should have_css('div#error_explanation')
  #       end.should_not change(User, :count)
  #     end
  #   end

    describe "success" do
      it "should make a new user" do
        users = User.all
        users.each do |user|
          user.destroy
        end
        @user = Factory(:user)

       
      
        lambda do
          visit login_path
          fill_in "email", :with => @user.email
          fill_in "password", :with => @user.password
          click_button "Anmelden"
          visit register_path
          fill_in "Name", :with => "New User"
          fill_in "EMail", :with => "joe@sample.com"
          select "Customer", :from => "Rolle"
          fill_in "Passwort", :with => "foobar"
          fill_in "Passwort wiederholen", :with => "foobar"
          click_button('Speichern')
          current_path.should eq(root_path)
        end.should change(User, :count).by(1)
      end

    end
  end

end