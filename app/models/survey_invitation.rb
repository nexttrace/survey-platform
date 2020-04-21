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
class SurveyInvitation < ApplicationRecord
  validates :organization, presence: true
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_token :token

  belongs_to :organization
end
