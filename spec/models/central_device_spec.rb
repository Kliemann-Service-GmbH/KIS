# == Schema Information
#
# Table name: central_devices
#
#  id                :bigint           not null, primary key
#  device_number     :string           default("0")
#  device_type       :string
#  location          :string
#  montage_date      :datetime
#  serial_number     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  service_object_id :bigint
#
# Indexes
#
#  index_central_devices_on_service_object_id  (service_object_id)
#

require 'rails_helper'

RSpec.describe CentralDevice, type: :model do
  it "is valid with valid attributes" do
    expect(build(:central_device)).to be_valid
  end
end
