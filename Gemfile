source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'sassc-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use mysql as the database for Active Record
gem 'mysql2'
#gem 'mysql2', '~> 0.3.20'
#gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.3'
#     sass-rails (~> 5.0) was resolved to 5.0.7, which depends on
#       railties (>= 4.0.0, < 6)
# gem 'sass-rails', '~> 5.0'
# gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#    coffee-rails (~> 4.2) was resolved to 4.2.2, which depends on
#      railties (>= 4.0.0)
# gem 'coffee-rails', '~> 4.2'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
#     jquery-rails was resolved to 4.3.3, which depends on
#       railties (>= 4.2.0)
# gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
#     web-console (>= 3.3.0) was resolved to 3.7.0, which depends on
#       railties (>= 5.0)
#   gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

gem 'therubyracer', platforms: :ruby
gem 'bcrypt', '~> 3.1.7'
#gem 'nokogiri', '~> 1.6.1'
#gem 'rails-i18n', '~> 4.0.1'
#gem 'foreigner', '~> 1.6.1'
# NoMethodError: undefined method `alias_method_chain' 回避の為kaminariやめ
#gem 'kaminari', '~> 0.15.1'
gem 'kaminari'
#gem 'date_validator', '~> 0.7.0'
#gem 'email_validator', '~> 1.4.0'
gem 'date_validator'
gem 'email_validator'
#     quiet_assets (~> 1.0.2) was resolved to 1.0.3, which depends on
#       railties (>= 3.1, < 5.0)
# gem 'quiet_assets', '~> 1.0.2', group: :development
group :test do
#     rspec-rails (~> 3.0.0.beta2) was resolved to 3.0.2, which depends on
#       railties (>= 3.0)
#   gem 'rspec-rails', '~> 3.0.0.beta2'
  gem 'spring-commands-rspec', '~> 1.0.1'
#  gem 'capybara', '~> 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
#  gem 'chromedriver-helper'
# 'factory_girl_rails' Rails5から'factory_bot_rails'へ変更
#  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'database_cleaner', '~> 1.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Rails5へのRspec導入から実行確認まで
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end
