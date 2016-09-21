# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::TypesEventUser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_type).class_name('Event::Type') }
    it { is_expected.to belong_to(:event_user).class_name('Event::User') }
  end
end
