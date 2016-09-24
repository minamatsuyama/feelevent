class Api::FavoritesController < ApplicationController
  def destroy
    render json: { "message": "Unauthorized" }, status: 401 and return unless user_signed_in?

    event_item = Event::Item.where(id: params[:id]).published.in_time
    render json: { "message": "Not Found" }, status: 404 and return if event_item.blank?

    favorite = event_item[0].event_favorites.where(event_user_id: current_user.id)
    render json: { "message": "Not Found" }, status: 404 and return if favorite.blank?

    favorite[0].destroy
    render json: { event_item_id: params[:id], count: event_item[0].event_favorites.count() }, status: 200
  end
end
