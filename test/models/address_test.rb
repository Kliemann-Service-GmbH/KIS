# == Schema Information
#
# Table name: addresses
#7
#  id              :bigint           not null, primary key
#  address_details :hstore
#  address_type    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = create(:address)
  end

  test 'valid address' do
    assert @address.valid?, 'Factory is invalid'
  end

  # Test Virtual Attributes
  test 'address_number' do
    @address.address_details = { address_number: 1 }
    assert_equal @address.address_number, "1"
  end

  test 'full_name' do
    @address.address_details = { prefix: 'Herr', first_name: 'Max', last_name: 'Mustermann' }
    assert_equal @address.full_name, "Herr Max Mustermann"
  end

  test 'post_address' do
    @address.address_details = { match_code: 00001, first_name: 'Max', last_name: 'Mustermann', street: 'Mustergasse', zip: '12345', city: 'Musterhausen' }
    assert_equal @address.post_address, "#{@address.full_name}\n#{@address.street}\n#{@address.zip_city}"
  end

  test 'post_address not set' do
    assert_not_nil @address.post_address
    assert_equal @address.post_address, ""
  end

  test 'email_address' do
    @address.address_details = { email_address: "max.mustermann@musterdomain.tld" }
    assert_equal @address.email_address, "max.mustermann@musterdomain.tld"
  end

  test 'email_address not set' do
    assert_not_nil @address.email_address
    assert_equal @address.email_address, ""
  end

  test 'telephone_number' do
    @address.address_details = { telephone_number: "+49 711 1234567890" }
    assert_equal @address.telephone_number, "+49 711 1234567890"
  end

  test 'telephone_number not set' do
    @address.address_details = nil
    assert_not_nil @address.telephone_number
    assert_equal @address.telephone_number, ""
  end

  test 'mobile_number' do
    @address.address_details = { mobile_number: "0160 1234567890" }
    assert_equal @address.mobile_number, "0160 1234567890"
  end

  test 'mobile_number not set' do
    @address.address_details = nil
    assert_not_nil @address.mobile_number
    assert_equal @address.mobile_number, ""
  end

  test 'short_name' do
    @address.address_details = { first_name: 'Max', last_name: 'Mustermann' }
    assert_equal @address.short_name, 'Max Mustermann'
  end

  test 'short_name not set' do
    @address.address_details = nil
    assert_equal @address.short_name, ''
  end

  test 'match_code' do
    @address.address_details = { match_code: 'AVL Deutschland GmbH' }
    assert_equal @address.match_code, 'AVL Deutschland GmbH'
  end

  test 'match_code not nil' do
    @address.address_details = nil
    assert_not_nil @address.match_code
    assert_equal @address.match_code, ''
  end

  test 'zip_city' do
    @address.address_details = { zip: 55252, city: "Mainz-Kastel" }
    assert_equal @address.zip_city, '55252, Mainz-Kastel'
  end

  test 'zip_city not nil' do
    @address.address_details = nil
    assert_not_nil @address.zip_city
    assert_equal @address.zip_city, ''
  end

  test 'address_line' do
    @address.address_details = { address_number: 99999, match_code: "Foo Bar GmbH" }
    assert_equal @address.address_line, "99999 - Foo Bar GmbH"
  end

  test 'address_line not nil' do
    @address.address_details = nil
    assert_not_nil @address.address_line
    assert_equal @address.address_line, ""
  end
end
