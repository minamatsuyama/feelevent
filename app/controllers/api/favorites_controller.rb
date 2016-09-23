class Api::FavoritesController < ApplicationController
  def index
    render json: { "message": "Unauthorized" }, status: 401 and return unless user_signed_in?
    current_page = params[:page] ? params[:page] : 1
    per_page = params[:per_page] ? params[:per_page] : 5
    @data = Event::Item.published.in_time.page(current_page).per(per_page).ordered.includes(:event_type, :event_favorites)
    pagination = {
      current_page: current_page,
      next_page: @data.next_page,
      prev_page: @data.prev_page,
      per_page: per_page,
      total_count: @data.total_count
    }
    render json: { data: [], meta: {} }, status: 200 and return if @data.blank?
    # Not add event_held_places and event_keywords data yet
    render json: @data, meta: pagination, adapter: :json, root: "data", meta_key: "pagination", status: 200
  end
end
