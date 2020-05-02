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
class Respondent < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false, allow_nil: true }
  validates :phone, uniqueness: { case_sensitive: false, allow_nil: true }
  nilify_blanks

  belongs_to :survey_invitation
  belongs_to :agency

  has_one :survey, dependent: :destroy

  passwordless_with :email

  def self.fetch_resource_for_passwordless(email)
    find_by_email(email) || find_by_phone(email)
  end

end
