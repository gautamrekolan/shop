require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    let(:user) { Factory(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    it "sends user the new password email" do
      mail.subject.should eq("Ihr neues Passwort | BERNER-Bikes.com")
      mail.to.should eq([user.email])
      mail.from.should eq(["info@BERNER-Bikes.com"])
      mail.body.encoded.should match(user.password)
    end
  end

  describe "order_notifier" do
    let(:order) { Factory(:order) }
    let(:mail) { UserMailer.order_notifier(order) }

    it "sends customer a notification about his order" do
      mail.subject.should eq("Ihre Bestellung | BERNER-Bikes.com")
      mail.to.should eq([order.email])
      mail.from.should eq(["info@BERNER-Bikes.com"])
      order.line_items.each do |item|
        mail.body.encoded.should match(item.product.title)
      end
    end
  end
end
