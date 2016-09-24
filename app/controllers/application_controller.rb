# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include AppErrors
  protect_from_forgery with: :exception

  rescue_from AppErrors::Error403, with: :render_403
  rescue_from AppErrors::Error404, with: :render_404
  rescue_from AppErrors::Error500, with: :render_500

  private

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
