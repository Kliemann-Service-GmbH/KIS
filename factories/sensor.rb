FactoryBot.define do
  factory :sensor do
    central_device
    gas_type
    sensor_type
    si_unit

    factory :sensor_with_range do
      min_value { 0.0 }
      max_value { 100.0 }
    end

    factory :sensor_with_application_date do
      application_date { Time.now }
    end
  end
end
