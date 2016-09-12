# frozen_string_literal: true
FactoryGirl.define do
  factory :event_address, class: 'Event::Address' do
    event_item_id { Faker::Number.between(1, 10000) }
    label         { Faker::Pokemon.location }
    country       { Faker::Address.country }
    zip_code      { Faker::Address.zip_code }
    state         { Faker::Address.state }
    city          { Faker::Address.city }
    address1      { Faker::Address.street_address }
    address2      { Faker::Address.secondary_address }
  end
end
