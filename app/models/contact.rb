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
  validates :email, uniqueness: { case_sensitive: false, allow_nil: true }
  validates :phone, uniqueness: { case_sensitive: false, allow_nil: true }
  nilify_blanks

  has_one :survey, dependent: :destroy
  has_many :agency_reports
  has_many :survey_reports

  passwordless_with :email

  def self.fetch_resource_for_passwordless(info)
    find_by_email(info) || find_by_phone(info)
  end

end
