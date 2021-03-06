# frozen_string_literal: true
# == Schema Information
#
# Table name: event_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  subscribe_newsletter   :boolean          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_event_users_on_email                 (email) UNIQUE
#  index_event_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
  has_many :event_type, through: :event_types_event_users, class_name: 'Event::Type'
end
