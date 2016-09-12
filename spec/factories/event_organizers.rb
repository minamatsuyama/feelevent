# frozen_string_literal: true
FactoryGirl.define do
  factory :event_organizer, class: 'Event::Organizer' do
    event_item_id { Faker::Number.between(1, 10000) }
    name          { Faker::Name.name }
  end
end
