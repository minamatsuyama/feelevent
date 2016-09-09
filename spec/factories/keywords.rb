# frozen_string_literal: true
FactoryGirl.define do
  factory :keyword do
    company_id { Faker::Number.between(1, 10_000) }
    name       { Faker::Lorem.word }
  end
end
