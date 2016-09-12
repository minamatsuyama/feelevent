# frozen_string_literal: true
class Event::Item < ApplicationRecord
  belongs_to :event_admin_user, class_name: 'Event::Admin::User'
  has_and_belongs_to_many :keywords, foreign_key: 'event_item_id'
  has_many :event_organizers, foreign_key: 'event_item_id', class_name: 'Event::Organizer'
  has_many :event_addresses, foreign_key: 'event_item_id', class_name: 'Event::Address'
  has_many :event_summary_contents, foreign_key: 'event_item_id', class_name: 'Event::SummaryContent'
  has_many :event_experience_contents, foreign_key: 'event_item_id', class_name: 'Event::ExperienceContent'

  extend Enumerize

  # TODO: set types
  enumerize :event_type, in: %i(seminar)
  enumerize :held_area, in: %i(kansai kantou)
  enumerize :currency, in: %i(yen dollar)
  enumerize :preparation_type, in: %i(needless individual team)
end
