# == Schema Information
#
# Table name: invitations
#
#  id         :bigint           not null, primary key
#  kind       :string           not null
#  sent_to    :string
#  sent_via   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agency_id  :bigint           not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_invitations_on_agency_id   (agency_id)
#  index_invitations_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#  fk_rails_...  (contact_id => contacts.id)
#
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
