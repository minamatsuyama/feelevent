# frozen_string_literal: true
class Event::ItemsKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :event_item, class_name: 'Event::Item'

  scope :in_keyword, ->(keyword_ids) { where(keyword_id: keyword_ids) }
end
