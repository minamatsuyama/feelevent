class Event::TypeSerializer < ActiveModel::Serializer
  attributes :value, :text

  def value
    object.code
  end

  def text
    object.name
  end
end
