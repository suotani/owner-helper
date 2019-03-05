FactoryBot.define do
  factory :house, class: House do
    name {Faker::Name.name}
    postal_code {Faker::Address.postcode.split("-").join}
    address{Faker::Address.city + Faker::Address.street_address}
    price {300}
  end
end