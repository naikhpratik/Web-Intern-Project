source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
#timer Script
gem 'gon'
gem 'roo'
gem 'binding_of_caller'
gem 'activerecord-session_store'
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
# jQuery UI
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'

# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'

# HAML
gem 'haml-rails'

# Cancan
gem 'cancancan', '~> 1.10'

# Acts-as
gem 'active_record-acts_as'

# Ancestry
gem 'ancestry'

# Ranked Model for contents positioning
gem 'ranked-model'

# Cocoon
gem "cocoon"

# App Config
gem "figaro"
# Text Editor
gem 'ckeditor'
# For ckeditor fix on production
gem 'non-stupid-digest-assets', '~> 1.0.9'
# File Uploader (using https for data transmission with encryption)
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
# For media processing in the background
gem 'carrierwave_backgrounder', git: 'https://github.com/lardawge/carrierwave_backgrounder'
gem 'carrierwave-video'
gem 'carrierwave-audio'
gem 'mini_magick'
gem 'fog-aws'

# Sanitize HTML
gem 'sanitize'

# Select2 for multiple select
gem 'select2-rails', '~> 4.0', '>= 4.0.1'
# Rails assets for Select2
source 'https://rails-assets.org' do
  gem 'rails-assets-select2', '~> 4.0.0'
end

gem 'rails-controller-testing'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Capistrano
gem 'capistrano', '~> 3.4.0'
gem 'capistrano-bundler'
gem 'capistrano-rails', '~> 1.1.0'
gem 'capistrano-rails-console'
gem 'capistrano-rvm'

gem 'daemons'
# Delayed Jobs
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'capistrano3-delayed-job', '~> 1.0'

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
  gem 'progress_bar'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'simplecov', :require => true
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
