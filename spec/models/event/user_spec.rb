# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:event_bookmarks).class_name('Event::Bookmark').with_foreign_key('event_user_id') }
  end
end
