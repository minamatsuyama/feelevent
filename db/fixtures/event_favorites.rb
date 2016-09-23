200.times do |n|
  Event::Favorite.seed(
    :id,
    {
      event_user_id:Faker::Number.between(1, 50),
      event_item_id: Faker::Number.between(1, 50)
    }
  )
end
