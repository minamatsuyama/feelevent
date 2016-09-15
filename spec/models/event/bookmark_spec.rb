# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::Bookmark, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_user).class_name('Event::User') }
    it { is_expected.to belong_to(:event_item).class_name('Event::Item') }
  end
end
