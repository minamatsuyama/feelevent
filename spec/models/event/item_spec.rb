# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::Item, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_admin_user).class_name('Event::Admin::User') }
  end
end
