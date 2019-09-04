after "development:001-addresses", "development:010-customers" do
  ServiceObject.destroy_all

  $service_object1 = ServiceObject.create!({
    address: $address1,
    customer: $customer1,
  })

  $service_object2 = ServiceObject.create!({
    address: $address2,
    customer: $customer2,
  })

  $service_object3 = ServiceObject.create!({
    address: $address3,
    customer: $customer2,
  })

  $service_object_avl = ServiceObject.create!({
    address: $address_object_avl,
    customer: $customer_avl,
    central_devices: [
      # $central_device_avl1,
      # $central_device_avl2,
      # $central_device_avl3,
      # $central_device_avl4,
      # $central_device_avl5,
      # $central_device_avl6
    ]
  })

  $service_object_deckel_maho = ServiceObject.create!({
    address: $address_deckel_maho,
    customer: $customer_deckel_maho,
    central_devices: [
      # $central_devices_deckel_maho
    ]
  })
end
