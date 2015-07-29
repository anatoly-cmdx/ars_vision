FactoryGirl.define do
  factory :company do
    country_code { Faker::Address.country_code }
    name { Faker::Company.name }
  end
end
