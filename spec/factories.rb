FactoryBot.define do
  factory :accu do
    central_device
  end

  factory :address do
    address_type { 'FactoryBot' }
    address_details {
      {
        name: 'FactoryBot',
        address_number: 1
      }
    }
  end

  factory :alarm_setting do
    central_device
  end

  factory :central_device do
    device_type { "Factory Device" }
    service_object
  end

  factory :contact_address do
    address
  end

  factory :customer do
    address
  end

  factory :gas_type do
    name { 'FactoryGas' }
  end

  factory :object_maintenance do
    service_object
    contact_address
  end

  factory :sensor_type do
    name { 'FactorySensor' }
  end

  factory :sensor do
    central_device
    gas_type
    sensor_type
    si_unit
  end

  factory :service_object do
    address
    customer
  end

  factory :service_protocol do
    central_device
  end

  factory :si_unit do
    name { 'FactorySI' }
  end
end
