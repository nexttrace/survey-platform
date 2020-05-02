# == Schema Information
#
# Table name: agencies
#
#  id         :bigint           not null, primary key
#  city       :string
#  county     :string
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Agency < ApplicationRecord
  validates :city, presence: true
  validates :county, presence: true
  validates :name, presence: true
  validates :state, presence: true

  has_many :agency_reports, dependent: :destroy
  has_many :contacts, through: :agency_reports, dependent: :destroy
  has_many :users, dependent: :destroy
end
