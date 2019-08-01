require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:baroness)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end
end
