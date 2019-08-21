source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use PostgreSQL as the database for Active Record.
gem 'pg', '~> 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# https://github.com/Casecommons/pg_search
gem 'pg_search'

gem 'rails-i18n', '~> 5.1'

gem 'jquery-rails'

gem 'font_awesome5_rails'

# https://github.com/rroblak/seed_dump
gem 'seed_dump'

# https://github.com/selfhouse/flashee
gem 'flashee'

# Prawn
# https://github.com/cortiz/prawn-rails/
gem 'prawn-rails', '~> 1.2'
# # https://github.com/umts/prawn-rails-forms/
gem 'prawn-rails-forms', '~> 0.1.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# SQL Server support
# https://github.com/rails-sqlserver/activerecord-sqlserver-adapter
gem 'tiny_tds'
gem 'activerecord-sqlserver-adapter'


group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # live reload
  gem 'guard-livereload', '~> 2.5', require: false
  gem "rack-livereload"

  gem "capistrano", "~> 3.10", require: false
  # Capistrano dependencies for ed25519 keys
  # https://github.com/net-ssh/net-ssh/issues/565
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-bundler', '~> 1.5'
  # https://github.com/capistrano/rvm
  gem 'capistrano-rvm'
  gem 'capistrano-postgresql', '~> 6.2'
  gem 'capistrano-yarn'
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-linked-files'

  # https://github.com/james2m/seedbank
  gem "seedbank"

  # debug l18n infos into development log, **commend while non l18n development**
  # gem 'i18n-debug'
  # https://github.com/glebm/i18n-tasks
  gem 'i18n-tasks', '~> 0.9.29'
  # google translate
  gem 'easy_translate'
end

group :test do
  # # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers'
  # https://github.com/teampoltergeist/poltergeist
  # gem 'poltergeist'

  # https://github.com/twalpole/apparition
  # gem 'apparition'
  gem 'apparition', github: 'twalpole/apparition'
end

group :development, :test do
    gem 'capybara'
    # https://relishapp.com/rspec/rspec-rails/v/3-8/docs/gettingstarted
    gem "rspec-rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
