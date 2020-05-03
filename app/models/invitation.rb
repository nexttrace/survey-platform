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
  nilify_blanks
  before_validation :standardize_phone

  validates :agency, presence: true
  validates :name, presence: true
  validates :phone, uniqueness: { allow_nil: true }, numericality: true, length: {is: 10}
  validates :email, uniqueness: { allow_nil: true, case_sensitive: false }
  validate :has_contact_method

  has_secure_token :token

  belongs_to :agency

  has_one :contact, dependent: :destroy
  has_one :survey, through: :contact

  scope :unused, -> { where("used_at IS NULL") }

private

  def standardize_phone
    return unless phone
    self.phone = phone.gsub(/^+1/, '').gsub(/[^0-9]/, '')
  end

  def has_contact_method
    errors.add(:base, "Either email or phone is required") if email.blank? && phone.blank?
  end

end
