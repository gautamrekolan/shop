class SessionsController < ApplicationController

  def new
    @title = "Login"
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @title = "Login"
    user = User.where( :name => params[:name] ).first
    
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user._id
        format.html { redirect_to root_url, notice: 'Sie sind eingeloggt!' }
      else
        format.html { redirect_to root_url, notice: 'Passwort oder Name falsch!' }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Ausgeloggt!"
  end

  def login
    respond_to do |format|
      format.js
      format.html
    end
  end
end
