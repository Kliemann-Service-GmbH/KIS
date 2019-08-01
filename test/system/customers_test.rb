require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:baroness)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: I18n.t(:customers_title)
  end

  test "search field" do
    visit customers_url
    # search
    fill_in :q, with: @customer.customer_number
    click_on I18n.t('Search')
    assert_selector "span", text: @customer.customer_number
  end
end
