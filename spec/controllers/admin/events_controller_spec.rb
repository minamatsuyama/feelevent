# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Admin::EventsController, type: :controller do
  describe 'GET #index' do
    context 'ログインしている場合' do
      login_admin :normal_user
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'ログインしていない場合' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to :new_admin_user_session
      end
    end
  end
end
