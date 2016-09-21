# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'events#index'

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

  resource :me, only: %i(show)

  namespace :admin do
    devise_for :users, class_name: 'Event::Admin::User'
  end

  namespace :api do
    resources :events, only: %i(index)
    resources :favorites, only: %i(index create destroy)
  end
end
