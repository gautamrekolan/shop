class PagesController < ApplicationController

  def home
  	@title = "Home"
    @news_items = NewsItem.where(:slideshow => true)
    @little_news = NewsItem.where(little_news: true).order_by([:created_at, :desc]).limit(3)

  end

  def impressum
  	@title = "Impressum"
  end

  def agb
  	@title = "AGB"
  end
  
end
