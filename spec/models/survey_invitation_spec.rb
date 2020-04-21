# == Schema Information
#
# Table name: survey_invitations
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  phone           :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_survey_invitations_on_email            (email) UNIQUE
#  index_survey_invitations_on_organization_id  (organization_id)
#  index_survey_invitations_on_phone            (phone) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
require 'rails_helper'

RSpec.describe SurveyInvitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
