# == Schema Information
#
# Table name: service_protocols
#
#  id                  :bigint           not null, primary key
#  is_commisioning     :boolean
#  is_expenditure      :boolean
#  is_function_check   :boolean
#  is_montage          :boolean
#  is_order            :boolean
#  is_repair           :boolean
#  is_service_contract :boolean
#  is_systemcheck      :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  central_device_id   :bigint
#
# Indexes
#
#  index_service_protocols_on_central_device_id  (central_device_id)
#

require 'rails_helper'

RSpec.describe ServiceProtocol, type: :model do
  it "is valid with valid attributes" do
    expect(build(:service_protocol)).to be_valid
  end
end
