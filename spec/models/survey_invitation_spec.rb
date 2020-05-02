# == Schema Information
#
# Table name: survey_invitations
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  token      :string
#  used_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agency_id  :bigint           not null
#
# Indexes
#
#  index_survey_invitations_on_agency_id  (agency_id)
#  index_survey_invitations_on_email      (email) UNIQUE
#  index_survey_invitations_on_phone      (phone) UNIQUE
#  index_survey_invitations_on_token      (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#
require 'rails_helper'

RSpec.describe SurveyInvitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
