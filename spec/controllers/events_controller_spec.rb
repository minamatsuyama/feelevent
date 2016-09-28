# frozen_string_literal: true
require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:event_item) { create :event_item }
    it 'returns http success' do
      get :show, id: event_item.id
      expect(response).to have_http_status(:success)
    end
  end
end
