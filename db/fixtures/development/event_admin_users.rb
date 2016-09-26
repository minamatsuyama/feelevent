# frozen_string_literal: true
Event::Admin::User.seed_once(:id) do |s|
    s.id = 2
    s.family_name = 'Normal'
    s.given_name = 'Admin'
    s.email = 'mod@example.com'
    s.password = 'password'
    s.password_confirmation = 'password'
    s.password_expiration_at = Time.zone.now + 3.months
    s.user_type = :normal_user
end
