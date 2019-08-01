require 'test_helper'

class ObjectMaintenanceTest < ActiveSupport::TestCase
  def setup
    @object_maintenance = object_maintenances(:baroness)
  end

  test 'valid object_maintenance' do
    assert @object_maintenance.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without service_object' do
    @object_maintenance.service_object = nil
    assert_not @object_maintenance.valid?, 'saved customer without a service_object'
    assert_not_nil @object_maintenance.errors[:service_object], 'no validation error for service_object present'
  end

  test 'invalid without contact_address' do
    @object_maintenance.contact_address = nil
    assert_not @object_maintenance.valid?, 'saved customer without a contact_address'
    assert_not_nil @object_maintenance.errors[:contact_address], 'no validation error for contact_address present'
  end
end
