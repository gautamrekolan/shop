class Notifier < ActionMailer::Base
  default from: "shop@berner-bikes.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received (order)
    @order = order

    mail to: order.email, :subject => "Bestätigung Deiner Bestellung bei BERNER-Bikes.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @order = order

    mail to: order.email, :subject => "Deine Bestellung bei BERNER-Bikes.com wurde versandt"
  end
end
