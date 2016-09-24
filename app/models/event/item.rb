# frozen_string_literal: true
class Event::Item < ApplicationRecord
  belongs_to :event_admin_user, class_name: 'Event::Admin::User'
  belongs_to :event_type, class_name: 'Event::Type'
  has_many :event_items_keywords, foreign_key: 'event_item_id', class_name: 'Event::ItemsKeyword'
  has_many :keywords, through: :event_items_keywords
  has_many :event_qualifying_ages_event_items, foreign_key: 'event_item_id', class_name: 'Event::QualifyingAgesEventItem'
  has_many :event_qualifying_age, through: :event_qualifying_ages_event_items, class_name: 'Event::QualifyingAge'
  has_many :event_organizers, foreign_key: 'event_item_id', class_name: 'Event::Organizer'
  has_many :event_held_places, foreign_key: 'event_item_id', class_name: 'Event::HeldPlace'
  has_many :event_summary_contents, foreign_key: 'event_item_id', class_name: 'Event::SummaryContent'
  has_many :event_review_contents, foreign_key: 'event_item_id', class_name: 'Event::ReviewContent'
  has_many :event_seminar_contents, foreign_key: 'event_item_id', class_name: 'Event::SeminarContent'
  has_many :event_favorites, foreign_key: 'event_item_id', class_name: 'Event::Favorite'

  extend Enumerize

  # TODO: set types
  enumerize :currency, in: %i(yen dollar)
  enumerize :preparation_type, in: %i(needless individual team)

  scope :published, -> { where(published: true) }
  scope :in_time, -> { where(" ? BETWEEN DATE_FORMAT(`event_items`.`publish_started_at`, '%Y-%m-%d') AND DATE_FORMAT(`event_items`.`publish_ended_at`, '%Y-%m-%d')", Time.now.utc.strftime('%Y-%m-%d')) }
end
