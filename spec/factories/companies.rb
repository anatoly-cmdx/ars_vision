FactoryGirl.define do
  factory :company do
    country_code { Faker::Address.country_code }
    name { Faker::Company.name }

    trait :with_people do
      transient do
        people_count 1
      end

      after(:create) do |company, evaluator|
        create_list(:person, evaluator.people_count, company: company)
      end
    end
  end
end
