# == Schema Information
#
# Table name: respondents
#
#  id                   :bigint           not null, primary key
#  email                :string
#  name                 :string
#  phone                :string
#  agency_id            :bigint           not null
#  survey_invitation_id :bigint           not null
#
# Indexes
#
#  index_respondents_on_agency_id             (agency_id)
#  index_respondents_on_survey_invitation_id  (survey_invitation_id)
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#  fk_rails_...  (survey_invitation_id => survey_invitations.id)
#
require 'rails_helper'

RSpec.describe Respondent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
