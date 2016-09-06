# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Unicorn as the app server
gem 'unicorn'
gem 'unicorn-worker-killer'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'active_model_serializers', '~> 0.10.0'
gem 'acts-as-list'
gem 'acts-as-taggable-on'
gem 'devise'
gem 'draper', '>= 3.0.0.pre1'
gem 'enumerize'
gem 'kaminari'
gem 'ransack'

gem 'cells'
gem 'cells-rails'
gem 'cells-erb'

gem 'carrierwave'
gem 'fog'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'

  gem 'rubocop', '~> 0.42.0', require: false
  gem 'rails_best_practices', require: false
  gem 'brakeman', require: false

  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-rails_best_practices', github: 'logankoester/guard-rails_best_practices'
  gem 'guard-brakeman'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler'
end

group :development, :test do
  gem 'bullet'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'pry-coolline'

  gem 'awesome_print'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'rails-controller-testing', require: false
  gem 'rspec-its'
  gem 'rspec-request_describer'
  gem 'json_spec'
  gem 'database_rewinder'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'capybara'
  gem 'poltergeist'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
