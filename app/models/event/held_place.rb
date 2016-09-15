# frozen_string_literal: true
class Event::HeldPlace < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'
end
