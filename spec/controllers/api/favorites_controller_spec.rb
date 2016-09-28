# frozen_string_literal: true
require 'rails_helper'

describe Api::FavoritesController do
  describe 'DELETE #destroy' do
    before(:each) do |testcase|
      unless testcase.metadata[:skip_before]
        @request.env['devise.mapping'] = Devise.mappings[:user]
        user = FactoryGirl.create(:event_user)
        sign_in user
      end
    end
    it 'is not signed in', skip_before: true do
      event_item = FactoryGirl.create(:event_item, published: false)
      delete :destroy, params: { id: event_item[:id] }, format: :json
      parsed_body = JSON.parse(response.body)
      expect(response.status).to eq(401)
      expect(parsed_body['message']).to eq('Unauthorized')
    end
    it 'is invalid event item' do
      event_item = FactoryGirl.create(:event_item, published: false)
      delete :destroy, params: { id: event_item[:id] }, format: :json
      parsed_body = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(parsed_body['message']).to eq('Not Found')
    end
    it 'has no favorite event' do
      event_item = FactoryGirl.create(:event_item, published: true, publish_started_at: Time.current - 1.day, publish_ended_at: Time.current + 1.day)
      FactoryGirl.create(:event_favorite, event_item_id: event_item[:id], event_user_id: subject.current_user[:id] + 1)
      delete :destroy, params: { id: event_item[:id] }, format: :json
      parsed_body = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(parsed_body['message']).to eq('Not Found')
    end
    it 'delete favorite event' do
      event_item = FactoryGirl.create(:event_item, published: true, publish_started_at: Time.current - 1.day, publish_ended_at: Time.current + 1.day)
      FactoryGirl.create(:event_favorite, event_item_id: event_item[:id], event_user_id: subject.current_user[:id])
      delete :destroy, params: { id: event_item[:id] }
      parsed_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_body['event_item_id']).not_to be_empty
    end
  end
end
