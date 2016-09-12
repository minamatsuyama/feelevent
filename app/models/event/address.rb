# frozen_string_literal: true
class Event::Address < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'
end
