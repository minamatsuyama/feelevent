# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, class_name: 'Event::User', controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path_names: {
    sign_in: 'signin',
    sign_out: 'singout',
    sign_up: 'signup'
  }

  ## 管理画面用
  ### ログイン係
  devise_for :admin_users, class_name: 'Event::Admin::User', path: 'admin', controllers: {
    sessions: 'admin/users/sessions',
    passwords: 'admin/users/passwords'
  }, path_names:  {
    sign_in: 'signin',
    sign_out: 'signout',
    sign_up: 'new'
  }

  authenticated(:admin_user) do
    root to: 'admin/events#index', as: :admin_authenticated_root
  end

  namespace :admin do
    resources :users, param: :event_admin_user_id
    get 'users/confirmations' => 'users/confirmations#show'
    resources :events, only: [:index]
  end
end
