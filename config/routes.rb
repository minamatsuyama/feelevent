# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, class_name: "Event::User"
  namespace :admin do
    devise_for :users, class_name: "Event::Admin::User"
  end
end
