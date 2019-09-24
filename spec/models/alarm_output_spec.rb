require 'rails_helper'

RSpec.describe AlarmOutput, type: :model do
  it "is valid with valid attributes" do
    expect(build(:address)).to be_valid
  end
end
