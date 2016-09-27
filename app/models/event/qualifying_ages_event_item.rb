# frozen_string_literal: true
class Event::QualifyingAgesEventItem < ApplicationRecord
  belongs_to :event_qualifying_age, class_name: 'Event::QualifyingAge'
  belongs_to :event_item, class_name: 'Event::Item'

  scope :qualifying_age_id, ->(qualifying_age_id) { where(event_qualifying_age_id: qualifying_age_id) }
end
