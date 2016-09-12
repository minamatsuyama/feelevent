# frozen_string_literal: true
class Event::Item < ApplicationRecord
  belongs_to :event_admin_user, class_name: 'Event::Admin::User'
  has_and_belongs_to_many :keywords, foreign_key: 'event_item_id'

  extend Enumerize

  # TODO: set types
  enumerize :event_type, in: %i(seminar)
  enumerize :held_area, in: %i(kansai kantou)
  enumerize :currency, in: %i(yen dollar)
  enumerize :preparation_type, in: %i(needless individual team)
end
