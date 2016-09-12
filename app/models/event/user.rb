# frozen_string_literal: true
class Event::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_bookmarks, foreign_key: 'event_user_id', class_name: 'Event::Bookmark'
end
