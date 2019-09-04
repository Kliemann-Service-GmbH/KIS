# == Schema Information
#
# Table name: contact_addresses
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  index_contact_addresses_on_address_id  (address_id)
#

require 'test_helper'

class ContactAddressTest < ActiveSupport::TestCase
  def setup
    @contact_address = create(:contact_address)
  end

  test 'valid contact_address' do
    assert @contact_address.valid?, 'Factory is invalid'
  end

  # Validations
  test 'invalid without address' do
    @contact_address.address = nil
    assert_not @contact_address.valid?, 'saved contact_address without a address'
    assert_not_nil @contact_address.errors[:address], 'no validation error for address present'
  end
end
