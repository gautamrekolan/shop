class SessionsController < ApplicationController

  def new
    @title = "Login"
  end

  def create
    @title = "Login"
    user = User.where( :name => params[:name] ).first
    
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user._id
        format.html { redirect_to root_url, notice: 'Sie sind eingeloggt.' }
      else
        format.html { render action: "new" }
        flash_now_alert = "Passwort oder Name falsch!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Ausgeloggt!"
  end
end
