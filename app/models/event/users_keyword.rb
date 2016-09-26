# frozen_string_literal: true
class Event::UsersKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :event_user, class_name: 'Event::User'
end
