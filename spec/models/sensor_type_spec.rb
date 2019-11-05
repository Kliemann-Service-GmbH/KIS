# == Schema Information
#
# Table name: sensor_types
#
#  id                :bigint           not null, primary key
#  default_livetime  :datetime
#  default_max_value :decimal(, )
#  default_min_value :decimal(, )
#  description       :text
#  livetime          :integer
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe SensorType, type: :model do
  let(:sensor_type) { create(:sensor_type) }

  subject { sensor_type }

  describe "Associations" do
    it { should have_many(:sensors) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:sensor_type)).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
  end
end
