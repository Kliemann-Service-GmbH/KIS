require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  setup do
    @address = create(:address)
    @customer = create(:customer)
    @service_object = create(:service_object)
    rebuild_multisearch
  end

  # Recreate the pg_search multisearch index
  def rebuild_multisearch
    PgSearch::Document.delete_all()
    [Customer, ServiceObject, CentralDevice, Address].each do |klass|
      PgSearch::Multisearch.rebuild(klass)
    end
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

  test "search field without value" do
    visit root_url
    # search
    click_on I18n.t('Search')

    assert_selector "div", text: @address.address_number
    assert_selector "div", text: @customer.customer_number
    assert_selector "div", text: @service_object.address.address_number
  end

  test "search Customer shows ServiceObjects" do
    visit root_url
    # search
    fill_in :q, with: @customer.address.address_number
    click_on I18n.t('Search')

    assert_selector "div", text: @customer.address.address_number
  end

end
