class ApplicationController < ActionController::Base
  protect_from_forgery
  $categories = Category.all
end
