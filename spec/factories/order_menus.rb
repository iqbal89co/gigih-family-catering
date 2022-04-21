FactoryBot.define do
  factory :order_menu do
    order_id { 1 }
    name { Faker::Food.dish }
    price { 15000.0 }
    qty { 1 }
  end
end
