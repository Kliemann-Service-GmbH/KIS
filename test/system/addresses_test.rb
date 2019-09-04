require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = create(:address)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: I18n.t(:addresses_title)
  end

  test "search field" do
    visit addresses_url
    # search
    fill_in :q, with: @address.address_details['last_name']
    click_on I18n.t('Search')

    assert_selector "div", text: @address.address_details['last_name']
  end
end
