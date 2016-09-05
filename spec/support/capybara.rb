# frozen_string_literal: true
require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
end
