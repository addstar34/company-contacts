FactoryGirl.define do
  factory :company do
    name "Hogwarts"

    factory :company_with_contacts do
      transient do
        contacts_count 3
      end

      after(:create) do |company, evaluator|
        create_list(:contact, evaluator.contacts_count, company: company)
      end
    end
  end

  factory :contact do
    sequence(:first_name) { |n| "first-#{n}"}
    sequence(:surname) { |n| "surname-#{n}" }
  end
end
