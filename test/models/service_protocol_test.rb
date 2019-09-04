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

require 'test_helper'

class ServiceProtocolTest < ActiveSupport::TestCase
  def setup
    @service_protocol = create(:service_protocol)
  end

  test 'valid service_protocol' do
    assert @service_protocol.valid?, 'Factory is invalid'
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
