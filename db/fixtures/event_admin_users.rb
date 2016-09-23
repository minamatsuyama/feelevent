# frozen_string_literal: true
Event::Admin::User.seed_once(:id) do |s|
  s.id = 1
  s.family_name = 'Super'
  s.given_name = 'Admin'
  s.email = 'admin@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.password_expiration_at = Time.zone.now + 3.months
  s.user_type = :super_user
end
