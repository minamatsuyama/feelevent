# frozen_string_literal: true
FactoryGirl.define do
  factory :event_user, class: 'Event::User' do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.pssword }
    password_confirmation { password }
    confirmed_at          Date.today
  end
end
