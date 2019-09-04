after "development:020-service_objects" do
  CentralDevice.destroy_all

  $central_device1 = CentralDevice.create!({
    service_object: $service_object1,
    device_number: 01,
    serial_number: 10000,
    device_type: "Central Device 01",
    location: "Location 01",
    montage_date: Time.now
  })

  $central_device2 = CentralDevice.create!({
    service_object: $service_object2,
    device_number: 02,
    serial_number: 20000,
    device_type: "Central Device 02",
    location: "Location 02",
    montage_date: Time.now
  })

  $central_device22 = CentralDevice.create!({
    service_object: $service_object2,
    device_number: 022,
    serial_number: 220000,
    device_type: "Central Device 022",
    location: "Location 022",
    montage_date: Time.now
  })

  $central_device23 = CentralDevice.create!({
    service_object: $service_object2,
    device_number: 023,
    serial_number: 230000,
    device_type: "Central Device 023",
    location: "Location 023",
    montage_date: Time.now
  })

  $central_device3 = CentralDevice.create!({
    service_object: $service_object3,
    device_number: 03,
    serial_number: 30000,
    device_type: "Central Device 03",
    location: "Location 03",
    montage_date: Time.now
  })


  $central_device_avl1 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 01,
    serial_number: 153008,
    device_type: "MCS 4000 BUS",
    location: "Keller",
    montage_date: ""
  })

  $central_device_avl2 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 02,
    serial_number: 154308,
    device_type: "MCS 4000 BUS",
    location: "Flaschenlager 1.OG",
    montage_date: ""
  })

  $central_device_avl3 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 03,
    serial_number: 154305,
    device_type: "MCS 4000 BUS",
    location: "Keller",
    montage_date: ""
  })

  $central_device_avl4 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 04,
    serial_number: 154307,
    device_type: "MCS 4000 BUS",
    location: "TB 102 - TB 104",
    montage_date: ""
  })

  $central_device_avl5 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 05,
    serial_number: 154306,
    device_type: "MCS 4000 BUS",
    location: "TB 101 - TB 103",
    montage_date: ""
  })

  $central_device_avl6 = CentralDevice.create!({
    service_object: $service_object_avl,
    device_number: 06,
    serial_number: 170405,
    device_type: "MCS 4000 BUS",
    location: "TB 106 - TB 108",
    montage_date: ""
  })

  $central_devices_deckel_maho = CentralDevice.create!({
    service_object: $service_object_deckel_maho,
    device_number: 1,
    serial_number: 99810,
    device_type: "MCS 2000-16",
    location: "Anlieferung"
  })


end
