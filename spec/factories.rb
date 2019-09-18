FactoryBot.define do
  factory :accu do
    central_device
  end

  factory :address do
    address_type { 'FactoryBot' }
    address_details {
      {
        name: Faker::Company.unique.name,
        match_code: Faker::Company.unique.name,
        address_number: rand(1000..9999)
      }
    }
  end

  factory :alarm_setting do
    central_device
  end

  factory :central_device do
    device_type { Faker::Device.model_name }
    service_object

    factory :central_device_with_sensors do
      device_number { 1 }
      serial_number { 2019-1234567 }
      device_type { "DEVICE-#{Faker::Hipster.word}" }
      location { "Somewhere" }
      montage_date { Time.now }

      after :create do |central_device, evaluator|
        create_list(:sensor, 2, central_device: central_device)
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
    name { "GAS-#{Faker::Name.initials(number: 3)}" }
    chemical_formula { "FORMULA-#{Faker::Name.initials(number: 2)}" }

    factory :gas_type_only_name do
      name { "GAS-#{Faker::Name.initials(number: 3)}" }
      chemical_formula { nil }
    end

    factory :gas_type_only_chemical_formula do
      name { nil }
      chemical_formula { "FORMULA-#{Faker::Name.initials(number: 2)}" }
    end
  end

  factory :object_maintenance do
    service_object
    contact_address
  end

  factory :sensor_type do
    name { "SENSOR-#{Faker::Name.name}" }
  end

  factory :sensor do
    central_device
    gas_type
    sensor_type
    si_unit

    factory :sensor_with_range do
      min_value { 0.0 }
      max_value { 100.0 }
    end
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

  factory :si_unit do
    name {  "SI-#{Faker::Name.name}" }
  end
end
