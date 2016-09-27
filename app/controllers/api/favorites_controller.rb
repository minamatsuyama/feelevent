# frozen_string_literal: true
class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    event_item = Event::Item.where(id: params[:id]).published.in_time
    raise AppErrors::Error404 if event_item.blank?

    existed_favorite = event_item[0].event_favorites.where(event_user_id: current_user.id)
    (render json: { message: 'Conflict' }, status: 409) && return if existed_favorite.present?

    @favorite = Event::Favorite.new({ event_user_id: current_user.id, event_item_id: params[:id] })
    @favorite.save!
    render json: { event_item_id: params[:id], count: event_item[0].event_favorites.length }, status: 201
  end
end
