class Api::EventsController < ApplicationController
  def index
    current_page = params[:page] ? params[:page] : 1
    per_page = params[:per_page] ? params[:per_page] : 5
    query = Event::Item.includes(:event_favorites, :event_type, :event_held_places, :event_summary_contents, :event_review_contents, :keywords)
    if params[:keyword_ids].present? && params[:keyword_ids].is_a?(Array)
      query = query.joins(:event_items_keywords).keyword_ids(params[:keyword_ids])
    end
    if params[:event_types].present? && params[:event_types].is_a?(Array)
      query = query.joins(:event_type).event_types(params[:event_types])
    end
    if params[:held_area].present?
      query = query.joins(:event_held_places).held_area(params[:held_area])
    end
    if params[:qualifying_age_id].present?
      query = query.joins(:event_qualifying_ages_event_items).qualifying_age_id(params[:qualifying_age_id])
    end
    if params[:held_started_on].present?
      query = query.held_started_on(params[:held_started_on])
    end
    if params[:held_ended_on].present?
      query = query.held_ended_on(params[:held_ended_on])
    end
    if params[:entry_fee].present?
      query = query.entry_fee(params[:entry_fee])
    end
    if params[:word].present?
      query = query.word(params[:word])
    end
    @data = query.page(current_page).per(per_page).order(entry_ended_at: :desc)
    render json: { data: [], pagination: {} }, status: 200 and return if @data.blank?
    pagination = {
      current_page: current_page,
      next_page: @data.next_page,
      prev_page: @data.prev_page,
      per_page: per_page,
      total_count: @data.total_count
    }
    render json: @data, adapter: :json, root: "data", meta: pagination, meta_key: "pagination", status: 200
  end
end
