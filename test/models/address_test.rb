require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = addresses(:baroness)
  end

  test 'valid address' do
    assert @address.valid?, 'Fixture baroness is invalid'
  end

  # Test Virtual Atrributes
  test 'address_number_baroness' do
    assert_equal @address.address_number, "1"
  end

  test 'address_number' do
    @address = addresses(:complete)
    assert_equal @address.address_number, "1457"
  end

  test 'full_name_baroness' do
    assert_equal @address.full_name, "Baroness"
  end

  test 'full_name' do
    @address = addresses(:contact_address)
    assert_equal @address.full_name, "Herr Max Mustermann"
  end

  test 'post_address_baroness' do
    assert_equal @address.post_address, "#{@address.match_code}\n#{@address.short_name}\n#{@address.street}\n#{@address.zip_city}"
  end

  test 'post_address' do
    @address = addresses(:complete)
    assert_equal @address.post_address, "#{@address.match_code}\n#{@address.short_name}\n#{@address.street}\n#{@address.zip_city}"
  end

  test 'email_address_baroness' do
    assert_equal @address.email_address, ""
  end

  test 'email_address' do
    @address = addresses(:contact_address)
    assert_equal @address.email_address, "max.mustermann@musterdomain.tld"
  end

  test 'telephone_number_baroness' do
    assert_equal @address.telephone_number, ""
  end

  test 'telephone_number' do
    @address = addresses(:contact_address)
    assert_equal @address.telephone_number, "+49 711 1234567890"
  end

  test 'mobile_number_baroness' do
    assert_equal @address.mobile_number, ""
  end

  test 'mobile_number' do
    @address = addresses(:contact_address)
    assert_equal @address.mobile_number, "0160 1234567890"
  end

  test 'short_name_baroness' do
    assert_equal @address.short_name, 'Baroness'
  end

  test 'short_name' do
    # complete baroness don't have first nor last name so we use the contact
    @address = addresses(:contact_address)
    assert_equal @address.short_name, 'Max Mustermann'
  end

  test 'match_code_baroness' do
    assert_equal @address.match_code, ''
  end

  test 'match_code' do
    @address = addresses(:complete)
    assert_equal @address.match_code, 'AVL Deutschland GmbH'
  end

  test 'zip_city_baroness' do
    assert_equal @address.zip_city, ''
  end

  test 'zip_city' do
    @address = addresses(:complete)
    assert_equal @address.zip_city, '55252, Mainz-Kastel'
  end

  test 'address_line_baroness' do
    assert_equal @address.address_line, "1 - Baroness"
  end

  test 'address_line' do
    @address = addresses(:complete)
    assert_equal @address.address_line, "1457 - AVL Deutschland GmbH"
  end
end
