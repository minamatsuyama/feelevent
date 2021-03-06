# frozen_string_literal: true
class Event::SummaryContent < ApplicationRecord
  belongs_to :event_item, class_name: 'Event::Item'

  extend Enumerize

  # TODO: set keys
  enumerize :layout, in: %i(left right)
end
