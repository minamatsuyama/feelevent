# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::Item, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_admin_user).class_name('Event::Admin::User') }
    it { is_expected.to have_and_belong_to_many(:keywords).with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_organizers).class_name('Event::Organizer').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_addresses).class_name('Event::Address').with_foreign_key('event_item_id') }
    it do
      is_expected.to have_many(:event_summary_contents)
        .class_name('Event::SummaryContent')
        .with_foreign_key('event_item_id')
    end
  end
end
