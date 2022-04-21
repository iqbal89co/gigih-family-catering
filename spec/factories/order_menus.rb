FactoryBot.define do
  factory :order_menu do
    order_id { 1 }
    name { Menu.first.name }
    price { Menu.first.price }
    qty { 2 }
  end
end
