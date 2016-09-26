# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::ItemsKeyword, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_item).class_name('Event::Item') }
    it { is_expected.to belong_to :keyword }
  end
end
