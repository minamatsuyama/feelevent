# frozen_string_literal: true
FactoryGirl.define do
  factory :event_seminar_content, class: 'Event::SeminarContent' do
    event_item_id { Faker::Number.between(1, 10000) }
    title         { Faker::Book.title }
    content       { Faker::Lorem.paragraph }
  end
end
