require 'test_helper'

class CentralDeviceTest < ActiveSupport::TestCase
  def setup
    @central_device = central_devices(:baroness)
  end

  test 'valid central_device' do
    assert @central_device.valid?, 'Fixture baroness is invalid'
  end
end
