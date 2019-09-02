FactoryBot.define do
  factory :accu do
    central_device
  end

  factory :address do
    address_type { 'FactoryBot' }
    address_details {
      {
        name: 'FactoryBot',
        match_code: 'Factory Bot',
        address_number: 1000
      }
    }
  end

  factory :alarm_setting do
    central_device
  end

  factory :central_device do
    device_type { "Factory Device" }
    service_object

    factory :central_device_with_sensors do
      transient do
        device_number { 1 }
        serial_number { 2019-1234567 }
        device_type { "Factory Device with Sensors" }
        location { "Somewere" }
        montage_date { Time.now }
      end
    end
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

    factory :service_object_with_service_contract do
      transient do
        service_contract_begin { 1.day.ago }
        service_contract_end { 1.day.from_now }
        service_contract_auto_resume_interval { 1 }
      end
    end
  end

  factory :service_protocol do
    central_device
  end

  factory :si_unit do
    name { 'FactorySI' }
  end
end
