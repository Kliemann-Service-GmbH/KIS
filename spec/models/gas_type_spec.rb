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
  it "is valid with valid attributes" do
    expect(build(:gas_type)).to be_valid
  end
end
