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
  let(:gas_type) { create(:gas_type) }

  subject { gas_type }

  describe "Associations" do
    it { should have_many(:sensors) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:gas_type)).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:chemical_formula) }

    context "allow blank fields" do
      it "is valid with name" do
        expect(build(:gas_type, name: Faker::Name.name)).to be_valid
      end

      it "is valid with chemical_formula" do
        expect(build(:gas_type, chemical_formula: Faker::Name.initials(number: 3))).to be_valid
      end

      it "is invalid without name or chemical_formula" do
        expect(build(:gas_type, name: nil, chemical_formula: nil)).to be_invalid
      end

      it "is invalid with same name" do
        name = Faker::Name.name
        create(:gas_type, name: name, chemical_formula: nil)
        expect(build(:gas_type, name: name, chemical_formula: nil)).to be_invalid
      end

      it "is invalid with same chemical_formula" do
        chemical_formula = Faker::Name.initials(number: 3)
        create(:gas_type, name: nil, chemical_formula: chemical_formula)
        expect(build(:gas_type, name: nil, chemical_formula: chemical_formula)).to be_invalid
      end

      it "allow blank fields in name" do
        create(:gas_type, name: " ", chemical_formula: Faker::Name.initials(number: 3))
        expect(build(:gas_type, name: " ", chemical_formula: Faker::Name.initials(number: 3))).to be_valid
      end

      it "allow blank fields in chemical_formula" do
        create(:gas_type, name: Faker::Name.name, chemical_formula: " ")
        expect(build(:gas_type, name: Faker::Name.name, chemical_formula: " ")).to be_valid
      end
    end
  end
end
