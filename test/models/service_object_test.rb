require 'test_helper'

class ServiceObjectTest < ActiveSupport::TestCase
  def setup
    @service_object = service_objects(:baroness)
  end

  test 'valid service_object' do
    assert @service_object.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without address' do
    @service_object.address = nil
    assert_not @service_object.valid?, 'saved customer without a address'
    assert_not_nil @service_object.errors[:address], 'no validation error for address present'
  end

  test 'invalid without customer' do
    @service_object.customer = nil
    assert_not @service_object.valid?, 'saved customer without a customer'
    assert_not_nil @service_object.errors[:customer], 'no validation error for customer present'
  end

  # Virtual Attributes
  test 'address_number_baroness' do
    assert_equal @service_object.object_number, "1"
  end

  test 'address_number' do
    @service_object = service_objects(:complete)
    assert_equal @service_object.object_number, "1457"
  end

  test 'object_number_baroness' do
    assert_equal @service_object.object_number, "1"
  end

  test 'object_number' do
    @service_object = service_objects(:complete)
    assert_equal @service_object.object_number, "1457"
  end

end
