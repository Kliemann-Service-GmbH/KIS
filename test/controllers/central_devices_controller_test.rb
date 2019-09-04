require 'test_helper'

class CentralDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @central_device = create(:central_device)
  end

  test "should get index" do
    get central_devices_url
    assert_response :success
  end

  test "should show central_device" do
    get central_device_url(@central_device)
    assert_response :success
  end
end
