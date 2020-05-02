# == Schema Information
#
# Table name: contacts
#
#  id    :bigint           not null, primary key
#  email :string
#  name  :string
#  phone :string
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
