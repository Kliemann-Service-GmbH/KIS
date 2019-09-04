ObjectMaintenance.destroy_all

$object_maintenances1 = ObjectMaintenance.create!({
  contact_address: $contact_address1,
  service_object: $service_object1
})

$object_maintenances2 = ObjectMaintenance.create!({
  contact_address: $contact_address2,
  service_object: $service_object2
})

$object_maintenances3 = ObjectMaintenance.create!({
  contact_address: $contact_address3,
  service_object: $service_object2
})
