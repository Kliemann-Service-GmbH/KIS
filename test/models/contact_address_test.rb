require 'test_helper'

class ContactAddressTest < ActiveSupport::TestCase
  def setup
    @contact_address = contact_addresses(:baroness)
  end

  test 'valid contact_address' do
    assert @contact_address.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without address' do
    @contact_address.address = nil
    assert_not @contact_address.valid?, 'saved contact_address without a address'
    assert_not_nil @contact_address.errors[:address], 'no validation error for address present'
  end
end
