# frozen_string_literal: true
class Event::Type < ApplicationRecord
  has_many :event_items, foreign_key: 'event_type_id', class_name: 'Event::Item'
  has_many :event_user, through: :event_types_event_users, class_name: 'Event::User'
end
