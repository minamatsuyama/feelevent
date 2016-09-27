# frozen_string_literal: true
class Api::BaseController < ApplicationController
  private

  def current_page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 5
  end

  def pagination(data)
    {
      current_page: current_page,
      next_page: data.next_page,
      prev_page: data.prev_page,
      per_page: per_page,
      total_count: data.total_count
    }
  end
end
