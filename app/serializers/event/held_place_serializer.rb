class Event::HeldPlaceSerializer < ActiveModel::Serializer
  attributes :value, :text

  def value
    object.area
  end

  def text
    object.title
  end
end
