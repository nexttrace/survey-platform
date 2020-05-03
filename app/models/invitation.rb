# == Schema Information
#
# Table name: invitations
#
#  id         :bigint           not null, primary key
#  sent_to    :string
#  sent_via   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_invitations_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#
class Invitation < ApplicationRecord
  validates :contact, presence: true
  validates :sent_via, presence: true
  validates :sent_to, presence: true

  belongs_to :contact
end
