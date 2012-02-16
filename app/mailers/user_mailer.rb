class UserMailer < ActionMailer::Base
  default from: "info@BERNER-Bikes.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Ihr neues Passwort | BERNER-Bikes.com'
  end

  def order_notifier(order)
    @order = order
    mail to: order.email, subject: 'Ihre Bestellung | BERNER-Bikes.com'
  end

  def progress_notifier(order)
    @order = order
    mail to: order.email, subject: 'Ihre Bestellung ist ' + order.status + ' | BERNER-Bikes.com'
  end
end
