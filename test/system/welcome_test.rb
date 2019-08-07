require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:baroness)
  end

  test "visiting the index" do
    visit root_url
  end

  test "search field" do
    visit root_url
    # search
    # TODO: extend with more models then @address and with more attributes to search against
    # fill_in :q, with: @address.address_details['last_name'] # failure
    fill_in :q, with: @address.address_details['match_code']
    click_on I18n.t('Search')

    # TODO: extend with more models then @address and with more attributes to search against
    # assert_selector "div", text: @address.address_details['last_name'] # failure
    assert_selector "div", text: @address.address_details['match_code']
  end
end
