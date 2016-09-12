# frozen_string_literal: true
class Event::Bookmark < ApplicationRecord
  belongs_to :event_user, class_name: 'Event::User'
  belongs_to :event_item, class_name: 'Event::Item'
end
