# frozen_string_literal: true
class Event::Promotion < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'
end
