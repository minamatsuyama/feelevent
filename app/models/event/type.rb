# frozen_string_literal: true
class Event::Type < ApplicationRecord
  has_many :event_items, class_name: 'Event::Item'
end
