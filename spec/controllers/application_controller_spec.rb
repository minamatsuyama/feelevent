# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def app_error_401
      raise AppErrors::Error401
    end

    def app_error_403
      raise AppErrors::Error403
    end

    def app_error_404
      raise AppErrors::Error404
    end

    def app_error_500
      raise AppErrors::Error500
    end
  end

  before do
    routes.draw do
      get 'anonymous/app_error_401'
      get 'anonymous/app_error_403'
      get 'anonymous/app_error_404'
      get 'anonymous/app_error_500'
    end
  end

  context 'HTML Error Pages' do

    it '403 Forbidden' do
      get :app_error_403
      expect(response).to render_template('html/errors/403')
      expect(response.status).to eq 403
    end

    it '404 Not Found' do
      get :app_error_404
      expect(response).to render_template('html/errors/404')
      expect(response.status).to eq 404
    end

    it '500 Internal Server Error' do
      get :app_error_500
      expect(response).to render_template('html/errors/500')
      expect(response.status).to eq 500
    end
  end

  context 'Json Error Messages' do
    it '401 Unauthorized' do
      get :app_error_401, format: :json
      expect(response.status).to eq 401
      expect(response.body).to be_json_eql(%({"message":"Unauthorized"}))
    end

    it '403 Forbidden' do
      get :app_error_403, format: :json
      expect(response.status).to eq 403
      expect(response.body).to be_json_eql(%({"message":"Forbidden"}))
    end

    it '404 Not Found' do
      get :app_error_404, format: :json
      expect(response.status).to eq 404
      expect(response.body).to be_json_eql(%({"message":"Not Found"}))
    end

    it '500 Internal Server Error' do
      get :app_error_500, format: :json
      expect(response.status).to eq 500
      expect(response.body).to be_json_eql(%({"message":"Internal Server Error"}))
    end
  end
end
