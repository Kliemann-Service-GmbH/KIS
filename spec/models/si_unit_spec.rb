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
  it "is valid with valid attributes" do
    expect(build(:si_unit)).to be_valid
  end
end
