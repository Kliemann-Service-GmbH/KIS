require "application_system_test_case"

class ServiceObjectsTest < ApplicationSystemTestCase
  setup do
    @service_object = service_objects(:baroness)
  end

  test "visiting the index" do
    visit service_objects_url
    assert_selector "h1", text: I18n.t(:service_objects_title)
  end

  test "search field" do
    visit service_objects_url
    # search
    fill_in :q, with: @service_object.object_number
    click_on I18n.t('Search')
    assert_selector "span", text: @service_object.object_number
  end

  test "creating a Service object" do
    visit service_objects_url
    click_on I18n.t('service_objects.index.New')

    # Customer (customer_number)
    select @service_object.customer.address_number_match_code, from: 'service_object_customer_id', match: :first
    # ServiceObject.address (match_code)
    select @service_object.address.address_line, from: 'service_object_address_id', match: :first

    find(:css, 'input[type="submit"]').click

    assert_text "Service object was successfully created"
    click_on I18n.t('Back')
  end

  test "create a Service object with service contract" do
    @service_object = service_objects(:with_service_contract)
    visit service_objects_url
    click_on I18n.t('service_objects.index.New')

    # Customer (customer_number)
    select @service_object.customer.address_number_match_code, from: 'service_object_customer_id', match: :first
    # ServiceObject.address (match_code)
    select @service_object.address.address_line, from: 'service_object_address_id', match: :first

    fill_in 'service_object_service_contract_begin', with: @service_object.service_contract_begin

    find(:css, 'input[type="submit"]').click

    assert_text "Service object was successfully created"
    click_on I18n.t('Back')
  end

  test "updating a Service object" do
    @service_object = service_objects(:complete)
    visit service_objects_url
    # search
    fill_in :q, with: @service_object.object_number
    click_on I18n.t('Search')

    click_on I18n.t('Edit'), match: :first

    select @service_object.address.address_line, from: 'service_object_address_id', match: :first
    find(:css, 'input[type="submit"]').click

    assert_text "Service object was successfully updated"
    click_on I18n.t('Back')
  end

  test "destroying a Service object" do
    visit service_objects_url
    # search
    fill_in :q, with: @service_object.object_number
    click_on I18n.t('Search')

    page.accept_confirm do
      click_on I18n.t('Destroy'), match: :first
    end

    assert_text "Service object was successfully destroyed"
  end
end
