class PagesController < ApplicationController

  def home
  	@title = "Home"
  end

  def impressum
  	@title = "Impressum"
  end

  def agb
  	@title = "AGB"
  end
  
end
