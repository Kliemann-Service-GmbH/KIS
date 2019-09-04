# == Schema Information
#
# Table name: gas_types
#
#  id               :bigint           not null, primary key
#  chemical_formula :string
#  description      :text
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe GasType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
