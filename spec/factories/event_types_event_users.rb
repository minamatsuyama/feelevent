FactoryGirl.define do
  factory :event_types_event_user, class: 'Event::TypesEventUser' do
    event_type_id { Faker::Number.between(1, 10000) }
    event_user_id { Faker::Number.between(1, 10000) }
  end
end
