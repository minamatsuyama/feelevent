# frozen_string_literal: true
class Event::HeldPlace < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'

  extend Enumerize

  enumerize :area, in: %i(hokkaido tohoku kanto chubu kinki shikoku kyushu overseas)

  scope :area, ->(area) { where(area: area) }
end
