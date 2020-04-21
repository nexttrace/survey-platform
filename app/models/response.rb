# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  data            :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  respondent_id   :bigint           not null
#
# Indexes
#
#  index_responses_on_organization_id  (organization_id)
#  index_responses_on_respondent_id    (respondent_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (respondent_id => respondents.id)
#
class Response < ApplicationRecord
  belongs_to :organization
  belongs_to :respondent
end
