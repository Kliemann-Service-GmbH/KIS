Address.destroy_all

$address1 = Address.create!({
  address_details: {
    match_code: "Address1",
    zip: "12345",
    city: "Address City1",
    address_number: "1000"
  }
})

$address2 = Address.create!({
  address_details: {
    match_code: "Address2",
    zip: "22345",
    city: "Address City2",
    address_number: "2000"
  }
})

$address3 = Address.create!({
  address_details: {
    match_code: "Address3",
    zip: "32345",
    city: "Address City3",
    address_number: "3000"
  }
})

$address_avl = Address.create!({
  address_details: {
    match_code: "AVL Deutschland GmbH",
    zip: "55252",
    city: "Mainz-Kastel",
    address_number: "1457"
  }
})
$address_customer = $address_avl
$address1 = $address_avl

$address_object_avl = Address.create!({
  address_details: {
    match_code: "AVL - Hauptgebäude Anlage 1",
    zip: "74321",
    city: "Bietigheim-Bissingen",
    street: "Carl-Zeiss-Straße 26",
    address_number: "1458"
  }
})
$address_object = $address_object_avl

$address_deckel_maho = Address.create!({
  address_details: {
    match_code: "Deckel Maho GmbH",
    zip: "87459",
    city: "Pfronten",
    street: "Deckel Maho Straße 1",
    address_number: "580"
  }
})
$address_object_customer_same = $address_deckel_maho

$address_contact1 = Address.create!({
  address_details: {
    prefix: "Herr",
    last_name: "Hartmann",
    telephone_number: "08363 - 89 - 6006",
    address_number: "0815-1"
  }
})

$address_contact2 = Address.create!({
  address_details: {
    first_name: "Marcel",
    last_name: "Resinnek",
    telephone_number: "071429129242",
    mobile_number: "0151 16177588",
    address_number: "0815-2"
  }
})

$address_contact3 = Address.create!({
  address_details: {
    prefix: "Herr",
    first_name: "Max",
    last_name: "Mustermann",
    telephone_number: "+49 711 1234567890",
    mobile_number: "0160 1234567890",
    email_address: "max.mustermann@musterdomain.tld",
    address_number: "0815-3"
  }
})
