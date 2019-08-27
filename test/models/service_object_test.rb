# == Schema Information
#
# Table name: service_objects
#
#  id                                    :bigint           not null, primary key
#  service_contract_auto_resume_interval :integer
#  service_contract_begin                :datetime
#  service_contract_end                  :datetime
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  address_id                            :bigint
#  customer_id                           :bigint
#
# Indexes
#
#  index_service_objects_on_address_id                  (address_id)
#  index_service_objects_on_address_id_and_customer_id  (address_id,customer_id) UNIQUE
#  index_service_objects_on_customer_id                 (customer_id)
#

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

  test 'invalid if address/ object combination already exists' do
    service_object_copy = @service_object.dup
    assert_not service_object_copy.valid?, 'address/ object combination already exists'
    assert_not_nil service_object_copy.errors[:address], 'no validation error for address present'
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

  # ServiceContract details
  test '#1 has service_contract with begin in the future' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
  end

  test '#2 has service_contract with begin in the past' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, true
  end

  test '#3 has service_contract with begin in the future with auto resume' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, false
  end

  test '#4 has service_contract with begin in the past with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, true
  end

  test '#5 has service_contract with begin in the future, end in future' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
  end

  test '#6 has service_contract with begin in the past, end in future' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, true
  end

  test '#7 has service_contract with begin in the future, end in future, with auto resume' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, false
  end

  test '#8 has service_contract with begin in the past, end in future, with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, true
  end

  test '#9 has service_contract with begin in the future, end in the past' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
    assert_not @service_object.valid?, 'saved service_contract_end is in the past, with service_contract_begin in the future'
    assert_not_nil @service_object.errors[:service_contract_end], 'no validation error for service_contract_end present'
  end

  test '#10 has service_contract with begin in the past, end in the past' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
  end

  test '#11 has service_contract with begin in the future, end in the past, with auto resume' do
    @service_object.service_contract_begin = 1.day.from_now
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, false
    assert_not @service_object.valid?, 'saved service_contract_end is in the past, with service_contract_begin in the future'
    assert_not_nil @service_object.errors[:service_contract_end], 'no validation error for service_contract_end present'
  end

  test '#12 has service_contract with begin in the past, end in the past, with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, true
  end

  test '#13 has service_contract with end in the future' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, true
  end

  test '#14 has service_contract with end in the future, with auto resume' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, true
  end

  test '#15 has service_contract with end in the past, with auto resume' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, true
  end

  test '#16 has service_contract with end in the past' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
  end

  test '#17 has no service_contract fields filled' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.has_service_contract, false
  end

  test '#18 has service_contract only with auto resume' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.has_service_contract, false
    assert_not @service_object.valid?, 'saved service_contract_auto_resume_interval is set without the other fields set'
    assert_not_nil @service_object.errors[:service_contract_auto_resume_interval], 'no validation error for service_contract_auto_resume_interval present'
  end

  # Test service_contract_length virtual attribute
  test 'has_service_contract baroness' do
    assert_not @service_object.has_service_contract
  end

  test 'has_service_contract' do
    @service_object = service_objects(:with_service_contract)
    assert_not @service_object.has_service_contract.nil?
  end

  test '#2 has service_contract begin in paste' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.service_contract_length, Time.now.end_of_year
  end

  test '#4 has service_contract begin in paste with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = nil
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.service_contract_length, Time.now.end_of_year
  end

  test '#6 has service_contract begin in paste, end in the future' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.service_contract_length, @service_object.service_contract_end
  end

  test '#8 has service_contract begin in paste, end in the future with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.service_contract_length, @service_object.service_contract_end
  end

  test '#12 has service_contract begin in paste, end in the paste with auto resume' do
    @service_object.service_contract_begin = 1.day.ago
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.service_contract_length, Time.now.end_of_year
  end

  test '#13 has service_contract end in the future' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = nil

    assert_equal @service_object.service_contract_length, @service_object.service_contract_end
  end

  test '#14 has service_contract end in the future with auto resume' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.from_now
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.service_contract_length, @service_object.service_contract_end
  end

  test '#15 has service_contract end in the paste with auto resume' do
    @service_object.service_contract_begin = nil
    @service_object.service_contract_end = 1.day.ago
    @service_object.service_contract_auto_resume_interval = 1

    assert_equal @service_object.service_contract_length, Time.now.end_of_year
  end

end
