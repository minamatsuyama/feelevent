# frozen_string_literal: true
FactoryGirl.define do
  factory :event_admin_user, class: 'Event::Admin::User' do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { password }
  end
end
