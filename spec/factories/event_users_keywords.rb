# frozen_string_literal: true
FactoryGirl.define do
  factory :event_users_keyword, class: 'Event::UsersKeyword' do
    event_user_id { Faker::Number.between(1, 10000) }
    keyword_id    { Faker::Number.between(1, 10000) }
  end
end
