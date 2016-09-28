# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Admin::BaseController, type: :controller do
  controller do
    before_action :authenticate_as_super_admin!, only: [:page_for_super_admin]
    def page_for_any_admin
      render plain: 'ok'
    end

    def page_for_super_admin
      render plain: 'ok'
    end
  end

  before :each do
    routes.draw do
      get 'anonymous/page_for_any_admin' => 'admin/base#page_for_any_admin'
      get 'anonymous/page_for_super_admin' => 'admin/base#page_for_super_admin'
    end
  end

  describe '.authenticate' do
    context 'When see pages for admin without login' do
      it 'be redirect to login' do
        get :page_for_any_admin
        is_expected.to redirect_to :new_admin_user_session
      end

      it 'be redirect to login' do
        get :page_for_super_admin
        is_expected.to redirect_to :new_admin_user_session
      end
    end

    context 'When login as normal admin' do
      login_as_admin :normal_user
      it 'can see page for admin' do
        get :page_for_any_admin
        expect(response.body).to eq 'ok'
      end

      it 'will reach to 403 forbidden when see pages for only super admin' do
        get :page_for_super_admin
        expect(response.status).to eq 403
      end
    end

    context 'When login as super admin' do
      login_as_admin :super_user
      it 'can see pages for admin' do
        get :page_for_any_admin
        expect(response.body).to eq 'ok'
      end

      it 'can see pages for only super admin' do
        get :page_for_super_admin
        expect(response.body).to eq 'ok'
        expect(response.status).to eq 200
      end
    end
  end
end
