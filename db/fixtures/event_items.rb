50.times do |n|
  held_started_at = Faker::Time.between(Time.current - 20.days, Time.current)
  entry_started_at = Faker::Time.between(Time.current - 20.days, Time.current)
  publish_started_at = Faker::Time.between(Time.current - 20.days, Time.current)
  Event::Item.seed(
    :id,
    {
      event_admin_user_id: Faker::Number.between(1, 10000),
      event_type_id: Faker::Number.between(1, 3),
      held_started_at: held_started_at,
      held_ended_at: held_started_at + Faker::Number.between(1, 10).days,
      entry_started_at: entry_started_at,
      entry_ended_at: entry_started_at + Faker::Number.between(1, 10).days,
      entry_fee: Faker::Number.decimal(2),
      currency: Event::Item.currency.values.sample,
      prize: Faker::Space.galaxy,
      preparation_type: Event::Item.preparation_type.values.sample,
      index_image: nil,
      detail_image: nil,
      publish_started_at: publish_started_at,
      publish_ended_at: publish_started_at + Faker::Number.between(1, 10).days,
      published: Faker::Boolean.boolean,
      title: Faker::Book.title,
      summary: Faker::Lorem.paragraph,
      site_url: Faker::Internet.url,
      inquiry: Faker::Name.name,
      charge_person: Faker::Name.name,
      contact_mail_address: Faker::Internet.email,
      contact_phone_number: Faker::PhoneNumber.phone_number,
      management_url: Faker::Internet.url,
    }
  )
end
