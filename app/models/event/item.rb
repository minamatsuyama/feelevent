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
  scope :held_area, ->(held_area) { where("`event_held_places`.`area` = ?", held_area) }
  scope :held_started_on, ->(held_started_on) { where("DATE_FORMAT(`event_item`.`held_started_on`, '%Y-%m-%d') <= ?", held_started_on) }
  scope :held_ended_on, ->(held_started_on) { where("DATE_FORMAT(`event_item`.`held_ended_on`, '%Y-%m-%d') >= ?", held_ended_on) }
  scope :entry_fee, ->(entry_fee) { where(entry_fee: entry_fee) }
  scope :word, ->(word) { where("`event_items`.`summary` LIKE ?", "%#{word}%") }
  scope :event_types, ->(event_types) { where("`event_types`.`code` IN (?)", event_types) }
  scope :keyword_ids, ->(keyword_ids) { where("`event_items_keywords`.`keyword_id` IN (?)", keyword_ids) }
  scope :qualifying_age_id, ->(qualifying_age_id) { where("`event_qualifying_ages_event_items`.`event_qualifying_age_id` = ?", qualifying_age_id) }
end
