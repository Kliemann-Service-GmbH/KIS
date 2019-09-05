# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  address_details :hstore
#  address_type    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  it "is valid with valid attributes" do
    expect(build(:address)).to be_valid
  end
end
