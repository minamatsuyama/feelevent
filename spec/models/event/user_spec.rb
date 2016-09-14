# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:event_bookmarks).class_name('Event::Bookmark').with_foreign_key('event_user_id') }
    it { is_expected.to have_many(:event_users_keywords).class_name('Event::UsersKeyword').with_foreign_key('event_user_id') }
    it { is_expected.to have_many(:keywords).through(:event_users_keywords) }
    it { is_expected.to have_many(:event_qualifying_ages_event_users).class_name('Event::QualifyingAgesEventUser').with_foreign_key('event_user_id') }
    it { is_expected.to have_many(:event_qualifying_age).class_name('Event::QualifyingAge').through('event_qualifying_ages_event_users') }
  end
end
