# frozen_string_literal: true
RSpec.configure do |config|
  config.before :suite do
    DatabaseRewinder.strategy = :transaction
    DatabaseRewinder.clean_with(:truncation)
  end

  config.before :each do
    DatabaseRewinder.strategy = :transaction
  end

  config.before :each, js: true do
    DatabaseRewinder.strategy = :truncation
  end

  config.before :each do
    DatabaseRewinder.start
  end

  config.after :each do
    DatabaseRewinder.clean
  end
end
