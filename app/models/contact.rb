# == Schema Information
#
# Table name: contacts
#
#  id    :bigint           not null, primary key
#  email :string
#  name  :string
#  phone :string
#
class Contact < ApplicationRecord
  passwordless_with :email

  validate :has_contact_method
  validates :email, uniqueness: { case_sensitive: false, allow_nil: true }
  validates :phone, uniqueness: { allow_nil: true }, phony_plausible: true

  phony_normalize :phone, default_country_code: "US", normalize_when_valid: true
  nilify_blanks

  has_one :survey, dependent: :destroy

  has_many :agency_reports, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :survey_reports, dependent: :destroy

  has_many :reporting_agencies, through: :agency_reports, source: :agency
  has_many :reporting_surveys, through: :survey_reports, source: :survey

  def self.fetch_resource_for_passwordless(info)
    find_by_lowercased_email(info) || find_by_normalized_phone(info)
  end

  def self.find_by_lowercased_email(email)
    where("lower(email) = ?", email.downcase).first
  end

  def self.find_by_normalized_phone(phone)
    find_by_phone PhonyRails.normalize_number(phone)
  end

private

  def has_contact_method
    errors.add(:base, "Either email or phone is required") if email.blank? && phone.blank?
  end

end
