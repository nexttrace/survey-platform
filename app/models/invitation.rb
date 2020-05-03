# == Schema Information
#
# Table name: invitations
#
#  id         :bigint           not null, primary key
#  kind       :string           not null
#  sent_to    :string
#  sent_via   :string
#  token      :string           not null
#  used_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agency_id  :bigint           not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_invitations_on_agency_id   (agency_id)
#  index_invitations_on_contact_id  (contact_id)
#  index_invitations_on_token       (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (agency_id => agencies.id)
#  fk_rails_...  (contact_id => contacts.id)
#
class Invitation < ApplicationRecord
  validates :contact,  presence: true
  validates :sent_to,  presence: true
  validates :sent_via, presence: true

  validates :kind, inclusion: { in: %w[test_result contact_notice] }

  belongs_to :contact
  belongs_to :agency

  has_secure_token :token

  scope :unused, -> { where(used_at: nil) }
  scope :for, -> (a, c) { where(agency: a, contact: c) }

  scope :email, -> { where(sent_via: "email") }
  scope :sms,   -> { where(sent_via: "sms") }

  scope :contact_notice, -> { where(kind: "contact_notice") }
  scope :test_result,    -> { where(kind: "test_result") }

  def self.send_test_result!(agency, contact)
    self.test_result.email.for(agency, contact).create! if contact.email
    self.test_result.sms.for(agency, contact).create! if contact.phone
  end

  # not yet implemented
  # def self.send_contact_notice!(agency, contact)
  #   self.contact_notice.email.for(agency, contact).create! if contact.email
  #   self.contact_notice.sms.for(agency, contact).create! if contact.phone
  # end

  before_validation do
    self.sent_to = email? ? contact.email : contact.phone
  end

  after_create do
    InvitationTexter.test_result(self).deliver_now if sms? && Twilio.auth_token
    InvitationMailer.test_result(self).deliver_now if email?
  end

  def sms?
    sent_via == "sms"
  end

  def email?
    sent_via == "email"
  end

end
