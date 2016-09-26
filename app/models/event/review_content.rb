# frozen_string_literal: true
class Event::ReviewContent < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'

  extend Enumerize

  # TODO: set keys
  enumerize :layout, in: %i(left right)
end
