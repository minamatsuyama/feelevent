# frozen_string_literal: true
FactoryGirl.define do
  factory :event_admin_user, class: 'Event::Admin::User' do
    email                  { Faker::Internet.email }
    family_name            { Faker::Name.first_name }
    given_name             { Faker::Name.last_name }
    password               { Faker::Internet.password }
    password_confirmation  { password }
    user_type              { Event::Admin::User.user_type.values.sample }
    password_expiration_at { Time.zone.now + 3.months }

    trait :super_user do
      user_type :super_user
    end

    trait :normal_user do
      user_type :normal_user
    end
  end
end
