FactoryGirl.define do
  factory :event_user, class: 'Event::User' do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.pssword }
    password_confirmation { password }
  end
end
