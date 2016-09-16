# frozen_string_literal: true
class Event::Item < ApplicationRecord
  belongs_to :event_admin_user, class_name: 'Event::Admin::User'
  has_many :event_items_keywords, foreign_key: 'event_item_id', class_name: 'Event::ItemsKeyword'
  has_many :keywords, through: :event_items_keywords
  has_many :event_qualifying_ages_event_items, foreign_key: 'event_item_id', class_name: 'Event::QualifyingAgesEventItem'
  has_many :event_qualifying_age, through: :event_qualifying_ages_event_items, class_name: 'Event::QualifyingAge'
  has_many :event_organizers, foreign_key: 'event_item_id', class_name: 'Event::Organizer'
  has_many :event_held_places, foreign_key: 'event_item_id', class_name: 'Event::HeldPlace'
  has_many :event_summary_contents, foreign_key: 'event_item_id', class_name: 'Event::SummaryContent'
  has_many :event_experience_contents, foreign_key: 'event_item_id', class_name: 'Event::ExperienceContent'
  has_many :event_seminar_contents, foreign_key: 'event_item_id', class_name: 'Event::SeminarContent'

  extend Enumerize

  # TODO: set types
  enumerize :event_type, in: %i(participatory lecture evaluation)
  enumerize :currency, in: %i(yen dollar)
  enumerize :preparation_type, in: %i(needless individual team)
end
