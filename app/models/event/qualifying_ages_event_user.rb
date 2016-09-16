# frozen_string_literal: true
class Event::QualifyingAgesEventUser < ApplicationRecord
  belongs_to :event_qualifying_age, class_name: 'Event::QualifyingAge'
  belongs_to :event_user, class_name: 'Event::User'
end
