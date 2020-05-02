# == Schema Information
#
# Table name: survey_reports
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint           not null
#  survey_id  :bigint           not null
#
# Indexes
#
#  index_survey_reports_on_contact_id  (contact_id)
#  index_survey_reports_on_survey_id   (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#  fk_rails_...  (survey_id => surveys.id)
#
class SurveyReport < ApplicationRecord
  belongs_to :survey
  belongs_to :contact
end
