require 'spec_helper'

describe 'Sessions' do

  describe 'login', :js => true do
    
    it "opens pop up login form and signs user in" do
      user = Factory(:user)
      visit root_path
      click_link 'login'
      fill_in "email", :with => user.email
      fill_in "password", :with => user.password
      click_button "Anmelden"
      current_path.should eq(root_path)
      page.should have_content("eingeloggt!")
    end

  end

end