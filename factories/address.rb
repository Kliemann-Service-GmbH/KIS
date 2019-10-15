FactoryBot.define do
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
end
