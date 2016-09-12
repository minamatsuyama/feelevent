# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :admin do
    devise_for :users, class_name: "Event::Admin::User"
  end
end
