# frozen_string_literal: true
RSpec.configure do |config|
  config.before :suite do
    SeedFu.seed
    seed_tables = %w(event_items event_favorites event_types keywords event_admin_users)
    DatabaseRewinder.strategy = :transaction, { except: seed_tables }
    DatabaseRewinder.clean_with(:truncation, { except: seed_tables })
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
