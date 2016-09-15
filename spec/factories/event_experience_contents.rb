# frozen_string_literal: true
FactoryGirl.define do
  factory :event_experience_content, class: 'Event::ExperienceContent' do
    event_item_id { Faker::Number.between(1, 10000) }
    profile_name  { Faker::Name.name }
    profile_image { nil }
    headline      { Faker::Book.title }
    content       { Faker::Lorem.paragraph }
    image         { nil }
    layout        { Event::SummaryContent.layout.values.sample }
    position      { Faker::Number.between(1, 10) }
  end
end
