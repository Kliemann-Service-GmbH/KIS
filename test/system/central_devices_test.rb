require "application_system_test_case"

class CentralDevicesTest < ApplicationSystemTestCase
  setup do
    Capybara.javascript_driver = :apparition
    @service_object = create(:service_object)
    @central_device = create(:central_device)
  end

  test "visiting the index" do
    visit central_devices_url()
    assert_selector "h1", text: I18n.t(:central_devices_title)
  end

  test "search field " do
    visit central_devices_url()
    # search
    fill_in :q, with: @central_device.device_type
    click_on I18n.t('Search')
    assert_selector "span", text: @central_device.device_type
  end

  test "search field nested under Service Object" do
    visit service_object_central_devices_url(@service_object)
    # search
    fill_in :q, with: @central_device.device_type
    click_on I18n.t('Search')
    assert_selector "span", text: @central_device.device_type
  end

  test "creating a Central device without Service Object" do
    visit central_devices_url()
    click_on I18n.t('central_devices.index.New')

    select @service_object.address.address_line, from: 'central_device_service_object_id', match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully created"
    click_on I18n.t('Back')
  end

  test "creating a Central device, with ServiceObject" do
    visit service_object_central_devices_url(@service_object)
    click_on I18n.t('central_devices.index.New')

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
    create(:si_unit)
    create(:gas_type)
    create(:sensor_type)
    visit central_devices_url()
    click_on I18n.t('central_devices.index.New')

    select @service_object.address.address_line, from: 'central_device_service_object_id', match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    5.times do
      click_on I18n.t('New Sensor')
    end

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully created"
  end

  test "updating a Central device" do
    visit central_devices_url()
    # search
    fill_in :q, with: @central_device.device_type
    click_on I18n.t('Search')

    click_on I18n.t('Edit'), match: :first

    fill_in :central_device_device_number, with: @central_device.device_number
    fill_in :central_device_device_type, with: @central_device.device_type
    fill_in :central_device_location, with: @central_device.location
    fill_in :central_device_montage_date, with: @central_device.montage_date

    find(:css, 'input[type="submit"]').click

    assert_text "Central device was successfully updated"
    click_on I18n.t('Back')
  end

  test "updating a Central device remove a sensor" do
    @central_device = create(:central_device_with_sensors)
    visit central_device_url(@central_device.id)

    click_on I18n.t('Edit'), match: :first
    click_on I18n.t('Destroy'), match: :first
    find(:css, 'input[type="submit"]').click
    assert_text "Central device was successfully updated"

    click_on I18n.t('Back')
  end

  test "destroying a Central device" do
    visit central_devices_url()
    # search
    fill_in :q, with: @central_device.device_type
    click_on I18n.t('Search')

    page.accept_confirm do
      click_on I18n.t('Destroy'), match: :first
    end

    assert_text "Central device was successfully destroyed"
  end
end
