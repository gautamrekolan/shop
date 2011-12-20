class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where( :name => params[:name] ).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user._id
      redirect_to root_path, :notice => "Eingeloggt!"
    else 
      flash_now_alert = "Passwort oder Name falsch!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Ausgeloggt!"
  end
end
