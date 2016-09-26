# frozen_string_literal: true
FactoryGirl.define do
  factory :event_favorite, class: 'Event::Favorite' do
    event_user_id { Faker::Number.between(1, 10000) }
    event_item_id { Faker::Number.between(1, 10000) }
  end
end
