# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::UsersKeyword, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_user).class_name('Event::User') }
    it { is_expected.to belong_to :keyword }
  end
end
