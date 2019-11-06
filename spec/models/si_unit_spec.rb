# == Schema Information
#
# Table name: si_units
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SiUnit, type: :model do
  let(:si_unit) { create(:si_unit) }

  subject { si_unit }

  describe "Associations" do
    it { should have_many(:sensors) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:si_unit)).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
  end
end
