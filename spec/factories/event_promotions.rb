# frozen_string_literal: true
FactoryGirl.define do
  factory :event_promotion, class: 'Event::Promotion' do
    event_item_id { Faker::Number.between(1, 10000) }
    frame_number  { Faker::Number.between(1, 4) }
    started_at    { Faker::Time.between(Time.current, Time.current + 1.month) }
    ended_at      { started_at + Faker::Number.between(1, 10).days }
    top_image     { nil }
    detail_image  { nil }
  end
end
