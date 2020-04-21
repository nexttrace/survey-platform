# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  city       :string
#  county     :string
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  validates :city, presence: true
  validates :county, presence: true
  validates :name, presence: true
  validates :state, presence: true

  has_many :users
  has_many :survey_invitations
end
