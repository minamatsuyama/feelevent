# frozen_string_literal: true
class Event::ItemsKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :event_item, class_name: 'Event::Item'
end
