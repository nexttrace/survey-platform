# == Schema Information
#
# Table name: survey_invitations
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_survey_invitations_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class SurveyInvitation < ApplicationRecord
  validates :organization, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  belongs_to :organization
end
