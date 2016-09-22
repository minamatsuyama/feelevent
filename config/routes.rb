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

  namespace :admin do
    devise_for :users, class_name: 'Event::Admin::User'
  end

  namespace :api, defaults: {format: :json} do
    post "favorites/:id"                           => "favorites#create", constraints: { id: /\d+/ }
  end
end
