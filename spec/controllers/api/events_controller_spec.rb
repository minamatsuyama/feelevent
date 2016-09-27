# frozen_string_literal: true
require 'rails_helper'

describe Api::EventsController do
  describe 'GET #index' do
    it 'get empty event_item result' do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).to be_empty
    end
    it 'get event_item result' do
      FactoryGirl.create(:event_item)
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
    end
    it 'get event_item with params event_types' do
      event_type = FactoryGirl.create(:event_type)
      FactoryGirl.create(:event_item, event_type_id: event_type[:id])
      get :index, params: { event_types: event_type[:code] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params keyword_ids' do
      event_item = FactoryGirl.create(:event_item)
      keyword = FactoryGirl.create(:event_items_keyword, event_item_id: event_item[:id])
      get :index, params: { keyword_ids: [keyword[:keyword_id]] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params word' do
      event_item = FactoryGirl.create(:event_item)
      get :index, params: { word: event_item[:summary][1..3] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params entry_fee'
    it 'get event_item with params held_area' do
      event_item = FactoryGirl.create(:event_item)
      held_place = FactoryGirl.create(:event_held_place, event_item_id: event_item[:id])
      get :index, params: { held_area: held_place[:area] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params held_started_on' do
      event_item = FactoryGirl.create(:event_item)
      get :index, params: { held_started_on: (event_item[:held_started_at].to_datetime + 1.day).strftime('%Y-%m-%d') }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params held_ended_on' do
      event_item = FactoryGirl.create(:event_item)
      get :index, params: { held_ended_on: (event_item[:held_ended_at].to_datetime - 1.day).strftime('%Y-%m-%d') }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
    it 'get event_item with params qualifying_age_id' do
      event_item = FactoryGirl.create(:event_item)
      event_qualifying_ages_event_item = FactoryGirl.create(:event_qualifying_ages_event_item, event_item_id: event_item[:id])
      get :index, params: { qualifying_age_id: event_qualifying_ages_event_item[:event_qualifying_age_id] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).not_to be_empty
      expect(response.status).to eq(200)
    end
  end
end
