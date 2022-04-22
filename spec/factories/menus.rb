FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description[0, 149] }
    price { 10000.0 }
    category_id { 1 }
  end

  factory :nil_menu, parent: :menu do
    name { nil }
    description { nil }
    price { 10000.0 }
    category_id { 1 }
  end

  factory :invalid_description_menu, parent: :menu do
    name { Faker::Food.dish }
    description { (0...200).map { ('a'..'z').to_a[rand(26)] }.join }
    price { 10000.0 }
    category_id { 1 }
  end
end
