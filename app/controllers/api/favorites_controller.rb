class Api::FavoritesController < ApplicationController
  def create
    render json: { "message": "Unauthorized" } and return unless user_signed_in?

    event_item = Event::Item.get_valid_item(params[:id])
    render json: { "message": "Not Found" }, status: 404 and return if event_item.blank?

    favorites = event_item.favorites.where("event_user_id = ?", current_user.id)
    render json: { "message": "Conflict" }, status: 409 and return if favorites.present?

    favorite = Event::Favorite.new({ event_user_id: current_user.id, event_item_id: params[:id] })
    favorite.save!
    render json: { event_item_id: params[:id], count: event_item.favorites.count() }, status: 201
  end
end
