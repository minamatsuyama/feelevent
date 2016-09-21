# frozen_string_literal: true
class Event::Type < ApplicationRecord
  has_many :event_items, class_name: 'Event::Item'
  has_many :event_user, through: :event_types_event_users, class_name: 'Event::User'
end
