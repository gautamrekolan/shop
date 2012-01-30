class PasswordResetsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    user = User.first(:conditions => { :email => email })
    user.send_password_reset
    redirect_to root_url, :notice => "Email mit neuem Passwort wurde versandt!"
  end
end