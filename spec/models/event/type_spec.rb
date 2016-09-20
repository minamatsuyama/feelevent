require 'rails_helper'

RSpec.describe Event::Type, type: :model do
  describe 'associations' do
    it { is_expected.to has_many(:event_item).class_name('Event::Item') }
  end
end
