# frozen_string_literal: true
Event::Admin::User.seed_once(:id) do |s|
<<<<<<< HEAD
    s.id = 2
    s.family_name = 'Normal'
    s.given_name = 'Admin'
    s.email = 'mod@example.com'
    s.password = 'password'
    s.password_confirmation = 'password'
    s.password_expiration_at = Time.zone.now + 3.months
    s.user_type = :normal_user
=======
  s.id = 2
  s.family_name = 'Normal'
  s.given_name = 'Admin'
  s.email = 'mod@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.password_expiration_at = Time.zone.now + 3.months
  s.user_type = :normal_user
>>>>>>> 72af8d28274be6dc7e021469cb9f8db48061df86
end
