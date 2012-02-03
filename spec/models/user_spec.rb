require "spec_helper"

describe User do


  it "should be valid with proper attributes" do
    user = Factory(:user)
  end

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).within(4..60) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:password)}
  it { should validate_length_of(:password).within(6..20) }
  it { should validate_presence_of(:role) }
  it { should validate_inclusion_of(:role).to_allow("Admin", "Shop Admin", "Customer") }
  
  describe "#generate_new_password" do
    let(:user) { Factory(:user) }
    it "should generate a new password" do
      old_password = user.password
      user.generate_new_password.should_not eq(old_password)
    end
    it "saves the time the password was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end
  end
  
  describe "#send_password_reset" do  
    let(:user) { Factory(:user) }

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end

    it "should include the generated new password" do
      user.generate_new_password
      user.send_password_reset
      last_email.body.should include(user.password)
    end
  end


end
