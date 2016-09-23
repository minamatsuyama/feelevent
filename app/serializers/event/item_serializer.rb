class Event::ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :preparation_type, :index_image, :entry_fee, :held_started_at, :held_ended_at, :entry_ended_at, :favorite_count
  belongs_to :event_type

  def favorite_count
    object.event_favorites.length
  end
end
