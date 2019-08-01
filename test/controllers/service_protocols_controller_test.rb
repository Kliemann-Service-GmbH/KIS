require 'test_helper'

class ServiceProtocolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_protocol = service_protocols(:baroness)
    @central_device = central_devices(:baroness)
  end

  test "should get index" do
    get service_protocols_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_service_protocol_url
  #   assert_response :error
  # end

  # test "should create service_protocol" do
  #   assert_difference('ServiceProtocol.count') do
  #     post service_protocols_url, params: { service_protocol: service_protocols(:complete).attributes }
  #   end
  #
  #   assert_redirected_to service_protocol_url(ServiceProtocol.last)
  # end
  #
  # test "should show service_protocol" do
  #   get service_protocol_url(@service_protocol)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_service_protocol_url(@service_protocol)
  #   assert_response :success
  # end
  #
  # test "should update service_protocol" do
  #   patch service_protocol_url(@service_protocol), params: { service_protocol: service_protocols(:complete).attributes }
  #   assert_redirected_to service_protocol_url(@service_protocol)
  # end
  #
  # test "should destroy service_protocol" do
  #   assert_difference('ServiceProtocol.count', -1) do
  #     delete service_protocol_url(@service_protocol)
  #   end
  #
  #   assert_redirected_to service_protocols_url
  # end
end
