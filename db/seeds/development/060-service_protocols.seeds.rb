after "development:030-central_devices" do
  ServiceProtocol.destroy_all

  $service_protocol1 = ServiceProtocol.create!(
    central_device: $central_device1
  )

  $service_protocol2 = ServiceProtocol.create!(
    central_device: $central_device2
  )

  $service_protocol3 = ServiceProtocol.create!(
    central_device: $central_device3
  )

  #
  # $service_protocol_avl1 = ServiceProtocol.create!(
  #   central_device: $central_device_avl1
  # )
  #
  # $service_protocol_avl1 = ServiceProtocol.create!(
  #   central_device: $central_device_avl1
  # )
  #
  # $service_protocol_avl2 = ServiceProtocol.create!(
  #   central_device: $central_device_avl2
  # )
  #
  # $service_protocol_avl3 = ServiceProtocol.create!(
  #   central_device: $central_device_avl3
  # )
  #
  # $service_protocol_avl4 = ServiceProtocol.create!(
  #   central_device: $central_device_avl4
  # )
  #
  # $service_protocol_avl5 = ServiceProtocol.create!(
  #   central_device: $central_device_avl5
  # )
  #
  # $service_protocol_avl6 = ServiceProtocol.create!(
  #   central_device: $central_device_avl6
  # )
  #
  # $service_protocol_deckel_maho = ServiceProtocol.create!(
  #   central_device: $central_devices_deckel_maho
  # )
end
