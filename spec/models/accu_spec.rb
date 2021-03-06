# == Schema Information
#
# Table name: accus
#
#  id                :bigint           not null, primary key
#  application_date  :datetime
#  livetime          :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_accus_on_central_device_id  (central_device_id)
#

require 'rails_helper'

RSpec.describe Accu, type: :model do
  it "is valid with valid attributes" do
    expect(build(:accu)).to be_valid
  end
end
