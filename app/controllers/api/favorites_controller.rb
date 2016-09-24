class Api::FavoritesController < ApplicationController
  def create
    render json: { "message": "Unauthorized" }, status: 401 and return unless user_signed_in?

    event_item = Event::Item.where(id: params[:id]).published.in_time
    render json: { "message": "Not Found" }, status: 404 and return if event_item.blank?

    existed_favorite = event_item[0].event_favorites.where(event_user_id: current_user.id)
    render json: { "message": "Conflict" }, status: 409 and return if existed_favorite.present?

    @favorite = Event::Favorite.new({ event_user_id: current_user.id, event_item_id: params[:id] })
    @favorite.save!
    render json: { event_item_id: params[:id], count: event_item[0].event_favorites.length }, status: 201
  end
end
