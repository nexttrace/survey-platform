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
class Invitation < ApplicationRecord
  validates :contact, presence: true
  validates :sent_via, presence: true
  validates :kind, inclusion: { in: %w[test_result contact_notice] }

  belongs_to :contact
  belongs_to :agency

  scope :for, -> (a, c) { where(agency: a, contact: c) }
  scope :email, -> { where(sent_via: "email") }
  scope :sms,   -> { where(sent_via: "sms") }
  scope :test_result, -> { where(kind: "test_result") }
  scope :test_result, -> { where(kind: "contact_notice") }

  def self.send_test_result!(agency, contact)
    self.test_result.email.for(agency, contact).create! if contact.email
    self.test_result.sms.for(agency, contact).create! if contact.phone
  end

  # not yet implemented
  # def self.send_contact_notice!(agency, contact)
  #   self.contact_notice.email.for(agency, contact).create! if contact.email
  #   self.contact_notice.sms.for(agency, contact).create! if contact.phone
  # end

  before_save :send_sms, if: :sms?
  before_save :send_email, if: :email?

  def sms?
    sent_via == "sms"
  end

  def email?
    sent_via == "email"
  end

  def send_sms
    self.sent_to = contact.phone
    generate_token!

    sms_message = "Gotham Public Health: Unfortunately, you have tested positive for COVID-19. Please self-isolate for 7 days or until 3 days after you are completely better.\n\nTo help us stop COVID-19, please take this survey to tell us who you have had contact with: #{token}"

    twilio.client.messages.create(
      from: twilio.phone_number,
      to: contact.phone,
      body: sms_message
    )
  end

  def send_email
    self.sent_to = contact.email
    generate_token!

    InvitationMailer.with(invitation: self).test_result.deliver_now
  end

  def generate_token!
    self[:token] ||= Passwordless::Session.create!(
      authenticatable: contact,
      user_agent: "#{sent_via} invitation",
      remote_addr: 'unknown',
    ).token
  end

end
