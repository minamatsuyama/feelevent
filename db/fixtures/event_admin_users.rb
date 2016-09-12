Event::Admin::User.seed_once(:id) do |s|
  s.id = 1
  s.email = 'admin@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
end
