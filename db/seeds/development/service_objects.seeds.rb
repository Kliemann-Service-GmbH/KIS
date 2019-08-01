$service_object_avl = ServiceObject.create({
      address: $address_object_avl,
      customer: $customer_avl,
      has_service_contract: true,
      central_devices: [
        $central_device_avl1,
        $central_device_avl2,
        $central_device_avl3,
        $central_device_avl4,
        $central_device_avl5,
        $central_device_avl6
      ]
})

$service_object_deckel_maho = ServiceObject.create({
      address: $address_deckel_maho,
      customer: $customer_deckel_maho,
      has_service_contract: false,
      central_devices: [
        $central_devices_deckel_maho,
      ]
})
