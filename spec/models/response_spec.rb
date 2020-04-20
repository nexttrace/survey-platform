# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  data            :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  respondent_id   :bigint
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
require 'rails_helper'

RSpec.describe Response, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
