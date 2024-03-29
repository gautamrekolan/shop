class PasswordResetsController < ApplicationController
  def new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    email = params[:email]
    user = User.first(:conditions => { :email => email })
    if user.nil?
      redirect_to root_url, :notice => "Email ist unbekannt!"
    else      
      user.send_password_reset
      redirect_to root_url, :notice => "Email mit neuem Passwort wurde versandt!"
    end
  end
end
