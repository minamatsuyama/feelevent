# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event::Item, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event_admin_user).class_name('Event::Admin::User') }
    it { is_expected.to have_many(:event_items_keywords).with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:keywords).with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_qualifying_ages_event_items).class_name('Event::QualifyingAgesEventItem').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_qualifying_age).class_name('Event::QualifyingAge').through('event_qualifying_ages_event_items') }
    it { is_expected.to have_many(:event_organizers).class_name('Event::Organizer').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_held_places).class_name('Event::HeldPlace').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_summary_contents).class_name('Event::SummaryContent').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_experience_contents).class_name('Event::ExperienceContent').with_foreign_key('event_item_id') }
    it { is_expected.to have_many(:event_seminar_contents).class_name('Event::SeminarContent').with_foreign_key('event_item_id') }
  end
end
