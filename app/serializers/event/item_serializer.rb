class Event::ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :preparation_type, :index_image, :entry_fee, :held_started_at, :held_ended_at, :entry_ended_at, :recommended, :reviewed, :favorite_count, :favorited
  belongs_to :event_type
  has_many :event_held_places, key: "held_areas"
  has_many :keywords

  def recommended
    return true if object.event_summary_contents.present? && object.event_summary_contents[0][:recommended]
    return false
  end

  def reviewed
    return true if object.event_review_contents.present?
    return false
  end

  def favorite_count
    object.event_favorites.length
  end

  def favorited
    return true if current_user.present? && object.event_favorites.where(event_user_id: current_user[:id])
    return false
  end
end
