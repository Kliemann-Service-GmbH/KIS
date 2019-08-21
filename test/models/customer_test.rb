# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  index_customers_on_address_id  (address_id)
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:baroness)
  end

  test 'valid customer' do
    assert @customer.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without address' do
    @customer.address = nil
    assert_not @customer.valid?, 'saved customer without a address'
    assert_not_nil @customer.errors[:address], 'no validation error for address present'
  end

  # Virtual Attributes
  test 'customer_number' do
    assert @customer.customer_number, @customer.address.address_number
  end
end
