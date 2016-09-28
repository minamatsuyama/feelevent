# frozen_string_literal: true
class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def destroy
    event_item = Event::Item.where(id: params[:id]).published.in_time
    raise AppErrors::Error404 if event_item.blank?

    favorite = event_item[0].event_favorites.where(event_user_id: current_user.id)
    raise AppErrors::Error404 if favorite.blank?

    favorite[0].destroy
    render json: { event_item_id: params[:id], count: event_item[0].event_favorites.count }, status: 200
  end
end
