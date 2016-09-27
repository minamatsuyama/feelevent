# frozen_string_literal: true
FactoryGirl.define do
  factory :event_type, class: 'Event::Type' do
    name { Faker::Name.name }
    code { Faker::Name.name }
  end
end
