# == Schema Information
#
# Table name: object_maintenances
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  contact_address_id :bigint
#  service_object_id  :bigint
#
# Indexes
#
#  index_object_maintenances_on_contact_address_id  (contact_address_id)
#  index_object_maintenances_on_service_object_id   (service_object_id)
#

require 'test_helper'

class ObjectMaintenanceTest < ActiveSupport::TestCase
  def setup
    @object_maintenance = create(:object_maintenance)
  end

  test 'valid object_maintenance' do
    assert @object_maintenance.valid?, 'Factory is invalid'
  end

  # Validations
  test 'invalid without service_object' do
    @object_maintenance.service_object = nil
    assert_not @object_maintenance.valid?, 'saved object_maintenance without a service_object'
    assert_not_nil @object_maintenance.errors[:service_object], 'no validation error for service_object present'
  end

  test 'invalid without contact_address' do
    @object_maintenance.contact_address = nil
    assert_not @object_maintenance.valid?, 'saved object_maintenance without a contact_address'
    assert_not_nil @object_maintenance.errors[:contact_address], 'no validation error for contact_address present'
  end
end
