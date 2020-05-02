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
require 'rails_helper'

RSpec.describe Agency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
