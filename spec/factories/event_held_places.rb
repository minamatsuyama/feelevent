# frozen_string_literal: true
FactoryGirl.define do
  factory :event_held_place, class: 'Event::HeldPlace' do
    event_item_id { Faker::Number.between(1, 10000) }
    title         { Faker::Address.state }
    area          { Faker::Address.state_abbr }
    map_enable    { Faker::Boolean.boolean }
    country       { Faker::Address.country }
    zip_code      { Faker::Address.zip_code }
    prefecture    { Faker::Number.between(1, 47) }
    state         { Faker::Address.state }
    city          { Faker::Address.city }
    address1      { Faker::Address.street_address }
    address2      { Faker::Address.secondary_address }
  end
end
