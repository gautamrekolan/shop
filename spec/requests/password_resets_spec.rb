require "spec_helper"

describe "PasswordResets" do
  it "emails user when requesting reset" do
    user = Factory(:user)
    visit login_path
    click_link 'Passwort'
    fill_in "Email", :with => user.email
    click_button "neues Passwort"
    current_path.should eq(root_path)
    page.should have_content("versandt!")
    last_email.to.should include(user.email)
  end

end