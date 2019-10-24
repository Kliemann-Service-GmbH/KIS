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
  describe "Associations" do
    it { should have_many(:sensors) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:gas_type)).to be_valid
    end

    # it "is valid with name"
    # it "is valid with chemical_formula"
    # it "is invalid without name or chemical_formula"
    # it "is invalid with same name or chemical_formula"
  end
end
