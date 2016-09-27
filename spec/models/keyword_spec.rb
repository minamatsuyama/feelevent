# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe 'scopes' do
    describe '#owner_managed' do
      it { expect(Keyword.owner_managed.to_sql).to eq Keyword.where(company_id: nil).to_sql }
    end
  end
end
