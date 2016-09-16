# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::QualifyingAgesEventUser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_qualifying_age).class_name('Event::QualifyingAge') }
    it { is_expected.to belong_to(:event_user).class_name('Event::User') }
  end
end
