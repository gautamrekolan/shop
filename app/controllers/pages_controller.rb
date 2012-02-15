class PagesController < ApplicationController

  def home
  	@title = "Home"
    @news_items = NewsItem.all
  end

  def impressum
  	@title = "Impressum"
  end

  def agb
  	@title = "AGB"
  end
  
end
