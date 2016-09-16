# frozen_string_literal: true
FactoryGirl.define do
  factory :event_qualifying_ages_event_item, class: 'Event::QualifyingAgesEventItem' do
    event_qualifying_age_id { Faker::Number.between(1, 10000) }
    event_item_id           { Faker::Number.between(1, 10000) }
  end
end
