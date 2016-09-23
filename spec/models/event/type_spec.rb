require 'rails_helper'

RSpec.describe Event::Type, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:event_items).class_name('Event::Item').with_foreign_key('event_type_id') }
  end
end
