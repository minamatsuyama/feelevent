# frozen_string_literal: true
FactoryGirl.define do
  factory :event_items_keyword, class: 'Event::ItemsKeyword' do
    event_item_id { Faker::Number.between(1, 10000) }
    keyword_id    { Faker::Number.between(1, 10000) }
  end
end
