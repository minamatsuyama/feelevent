# frozen_string_literal: true
class Event::Organizer < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'
end
