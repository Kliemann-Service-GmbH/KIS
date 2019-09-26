# == Schema Information
#
# Table name: central_devices
#
#  id                :bigint           not null, primary key
#  accu_montage_date :datetime
#  device_number     :string           default("0")
#  device_type       :string
#  has_accu          :boolean
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

require 'test_helper'

class CentralDeviceTest < ActiveSupport::TestCase
  def setup
    @central_device = create(:central_device)
  end

  test 'valid central_device' do
    assert @central_device.valid?, 'Factory is invalid'
  end
end
