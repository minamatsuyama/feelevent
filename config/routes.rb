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

  resources :events, only: %i(show)
  resource :me, only: %i(show)
  namespace :me do
    resource :settings, only: %i(edit update)
    resources :favorites, only: %i(index)
  end

  namespace :admin do
    devise_for :users, class_name: 'Event::Admin::User'
  end

  namespace :api do
    resources :events, only: %i(index)
    resources :favorites, only: %i(index create destroy)
  end
end
