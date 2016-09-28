# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe 'scopes' do
    describe '.managed_by_owner' do
      it { expect(Keyword.managed_by_owner.to_sql).to eq Keyword.where(company_id: nil).to_sql }
    end
  end
end
