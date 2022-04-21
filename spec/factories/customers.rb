FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
  factory :invalid_email_customer, parent: :customer do
    name { Faker::Name.name }
    email { "blaa@blaa" }
  end
end
