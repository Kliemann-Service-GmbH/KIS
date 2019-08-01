require "application_system_test_case"

class ServiceProtocolsTest < ApplicationSystemTestCase
  setup do
    @service_protocol = service_protocols(:baroness)
    @central_device = central_devices(:baroness)
  end

  test "visiting the index" do
    visit service_protocols_url
    assert_selector "h1", text: I18n.t(:service_protocols_title)
  end

  test "search field" do
    visit service_protocols_url
    # search
    fill_in :q, with: @service_protocol.device_number
    click_on I18n.t('Search')
    assert_selector "span", text: @service_protocol.device_number
  end

  test "creating a Service protocol, only valid within a CentralDevice" do
    @central_device = central_devices(:complete)
    visit central_device_url(@central_device)
    click_on I18n.t(:new_central_device_service_protocol)

    find(:css, 'input[type="submit"]').click

    assert_text "Service protocol was successfully created"
    click_on I18n.t('Back')
  end

  test "destroying a Service protocol" do
    visit service_protocols_url
    # search
    fill_in :q, with: @service_protocol.device_number
    click_on I18n.t('Search')

    page.accept_confirm do
      click_on I18n.t("Destroy"), match: :first
    end

    assert_text "Service protocol was successfully destroyed"
  end
end
