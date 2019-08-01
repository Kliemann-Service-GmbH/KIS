require 'test_helper'

class ServiceProtocolTest < ActiveSupport::TestCase
  def setup
    @service_protocol = service_protocols(:baroness)
  end

  test 'valid service_protocol' do
    assert @service_protocol.valid?, 'Fixture baroness is invalid'
  end

  # # Validations
  test 'invalid without central_device' do
    @service_protocol.central_device = nil
    assert_not @service_protocol.valid?, 'saved customer without a central_device'
    assert_not_nil @service_protocol.errors[:central_device], 'no validation error for central_device present'
  end

  # test 'invalid without service_object' do
  #   @service_protocol.service_object = nil
  #   assert_not @service_protocol.valid?, 'saved customer without a service_object'
  #   assert_not_nil @service_protocol.errors[:service_object], 'no validation error for service_object present'
  # end
  #
  # # Virtual Attributes
  # test "device_number" do
  #   assert_equal @service_protocol.device_number, "1"
  # end
end
