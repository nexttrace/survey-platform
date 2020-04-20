# == Schema Information
#
# Table name: respondents
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Respondent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
