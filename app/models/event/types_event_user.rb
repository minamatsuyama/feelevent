# frozen_string_literal: true
class Event::TypesEventUser < ApplicationRecord
  belongs_to :event_type, class_name: 'Event:Type'
  belongs_to :event_user, class_name: 'Event:User'
end
