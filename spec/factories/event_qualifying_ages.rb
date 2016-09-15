# frozen_string_literal: true
FactoryGirl.define do
  factory :event_qualifying_age, class: 'Event::QualifyingAge' do
    name { Faker::Name.name }
  end
end
