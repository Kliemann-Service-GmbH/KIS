require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = create(:address)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end
end
