source 'http://rubygems.org'

gem 'rails', '3.2.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'therubyracer'
gem 'rake'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'rmagick'
gem 'capistrano'
gem "mongoid", "~> 2.3"
gem "bson_ext", "~> 1.4"
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem "cancan"
gem "koala"
gem "kaminari"

group :development do
  gem 'rspec-rails'
  gem 'ruby_gntp'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'faker'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'spork', '~> 1.0rc'
  gem 'guard-spork'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'passenger'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

