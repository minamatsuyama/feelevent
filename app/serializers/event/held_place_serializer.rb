# frozen_string_literal: true
class Event::HeldPlaceSerializer < ActiveModel::Serializer
  attributes :value, :text

  def value
    object.area
  end

  def text
    object.title
  end
end
