# frozen_string_literal: true
FactoryGirl.define do
  factory :event_user, class: 'Event::User' do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    subscribe_newsletter  { Faker::Boolean.boolean }
    confirmed_at          { Time.zone.today }
  end
end
