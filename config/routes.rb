# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, class_name: 'Event::User', controllers: {
    confirmations: 'users/registrations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  namespace :admin do
    devise_for :users, class_name: 'Event::Admin::User'
  end
end
