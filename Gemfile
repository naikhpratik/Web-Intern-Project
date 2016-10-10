source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'

gem 'binding_of_caller'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bcrypt-ruby'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'

# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'

# Cancan
gem 'cancancan', '~> 1.10'

# Acts-as
gem 'active_record-acts_as'

# Ancestry
gem 'ancestry'

# Cocoon
gem "cocoon"

# Text Editor
gem 'ckeditor'

gem 'rails-controller-testing'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'capistrano', '~> 3.4.0'
gem 'capistrano-bundler'
gem 'capistrano-rails', '~> 1.1.0'
gem 'capistrano-rails-console'
gem 'capistrano-rvm'

gem 'airbrake'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end

group :production, :staging do
  gem 'unicorn'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'selenium-webdriver'
  gem "codeclimate-test-reporter",  require: nil
end
