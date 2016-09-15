# frozen_string_literal: true
class Event::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_favorites, foreign_key: 'event_user_id', class_name: 'Event::Favorite'
  has_many :event_users_keywords, foreign_key: 'event_user_id', class_name: 'Event::UsersKeyword'
  has_many :keywords, through: :event_users_keywords
  has_many :event_qualifying_ages_event_users, foreign_key: 'event_user_id', class_name: 'Event::QualifyingAgesEventUser'
  has_many :event_qualifying_age, through: :event_qualifying_ages_event_users, class_name: 'Event::QualifyingAge'
end
