# == Schema Information
#
# Table name: surveys
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agency_id  :bigint           not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_surveys_on_agency_id   (agency_id)
#  index_surveys_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#  fk_rails_...  (contact_id => contacts.id)
#
class Survey < ApplicationRecord
  belongs_to :agency
  belongs_to :contact, dependent: :destroy

  has_many :reported_contacts, class_name: "Contact", through: :survey_reports
  has_many :survey_reports, depentent: :destroy
end
