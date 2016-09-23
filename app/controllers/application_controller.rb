# frozen_string_literal: true
class AppError403 < StandardError; end
class AppError404 < StandardError; end
class AppError500 < StandardError; end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # config/environments/**.rb 内の consider_all_requests_local で判断する
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,                                  with: :render_500
    rescue_from ActiveRecord::RecordNotFound,               with: :render_404
    rescue_from ActionView::MissingTemplate,                with: :render_404
    rescue_from Pundit::NotAuthorizedError,                 with: :render_403
    rescue_from ActionController::InvalidAuthenticityToken, with: :render_403
    rescue_from AppError403,                                with: :render_403
    rescue_from AppError404,                                with: :render_404
    rescue_from AppError500,                                with: :render_500
  end

  def render_403(e = nil)
    logger.error "exception(#{e.class}): #{e.message} #{e.backtrace.first}" if e
    respond_to do |format|
      format.html { render file: 'html/errors/403', status: :forbidden }
      format.json { render json: { message: 'Forbidden' }, status: :forbidden }
    end
  end

  def render_404(e = nil)
    logger.error "exception(#{e.class}): #{e.message} #{e.backtrace.first}" if e
    respond_to do |format|
      format.html { render file: 'html/errors/404', status: :not_found }
      format.json { render json: { message: 'Not Found' }, status: :not_found }
    end
  end

  def render_500(e = nil)
    logger.error "exception(#{e.class}): #{e.message} #{e.backtrace.first}" if e
    respond_to do |format|
      format.html { render file: 'html/errors/500', status: :internal_server_error, layout: false }
      format.json { render json: { message: 'Internal Server Error' }, status: :internal_server_error }
    end
  end
end
