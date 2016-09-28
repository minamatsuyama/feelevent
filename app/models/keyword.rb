# frozen_string_literal: true
# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  company_id :integer
#  name       :string(255)      not null
#
# Indexes
#
#  index_keywords_on_company_id  (company_id)
#

class Keyword < ApplicationRecord
  scope :managed_by_owner, -> { where(company_id: nil) }
end
