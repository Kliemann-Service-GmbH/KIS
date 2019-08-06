require "application_system_test_case"

class CentralDevicesTest < ApplicationSystemTestCase
  setup do
    Capybara.javascript_driver = :apparition
    @service_object = service_objects(:baroness)
    @central_device = central_devices(:baroness)
  end

  test "visiting the index" do
    visit service_object_central_devices_url(@service_object)
    assert_selector "h1", text: I18n.t(:central_devices_title)
  end

  test "search field" do
    visit service_object_central_devices_url(@service_object)
    # search
    fill_in :q, with: @central_device.device_number
    click_on I18n.t('Search')
    assert_selector "span", text: @central_device.device_number
  end

  test "creating a Central device, without ServiceObject" do
    visit central_devices_url()
    click_on I18n.t('central_devices.index.New')

    select "#{@service_object.address.address_number_match_code.strip!}", from: 'central_device_service_object_id', match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully created"
    click_on I18n.t('Back')
  end

  test "creating a Central device, with ServiceObject" do
    @service_object = service_objects(:complete)
    @central_device = central_devices(:complete)
    visit service_object_central_devices_url(@service_object)
    click_on I18n.t('central_devices.index.New')

    assert page.has_select?('central_device_service_object_id', selected: "#{@service_object.address.address_number_match_code.strip!}")

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_serial_number, with: @central_device.serial_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully created"
    click_on I18n.t('Back')
  end

  test "creating Sensors on Central device" do
    @central_device = central_devices(:complete)
    visit central_devices_url()
    click_on I18n.t('central_devices.index.New')

    select "#{@service_object.address.address_number_match_code.strip!}", from: 'central_device_service_object_id', match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    click_on I18n.t('New Sensor')
    click_on I18n.t('New Sensor')
    click_on I18n.t('New Sensor')
    click_on I18n.t('New Sensor')
    click_on I18n.t('New Sensor')
    click_on I18n.t('New Sensor')

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully created"
    click_on I18n.t('Back')
  end

  test "updating a Central device" do
    visit central_devices_url
    click_on I18n.t('Edit'), match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully updated"
    click_on I18n.t('Back')
  end

  test "destroying a Central device" do
    visit central_devices_url
    # search
    fill_in :q, with: @central_device.device_number
    click_on I18n.t('Search')

    page.accept_confirm do
      click_on I18n.t('Destroy'), match: :first
    end

    assert_text "Central device was successfully destroyed"
  end
end
