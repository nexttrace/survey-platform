# == Schema Information
#
# Table name: agency_reports
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agency_id  :bigint           not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_agency_reports_on_agency_id   (agency_id)
#  index_agency_reports_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#  fk_rails_...  (contact_id => contacts.id)
#
require 'rails_helper'

RSpec.describe AgencyReport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
