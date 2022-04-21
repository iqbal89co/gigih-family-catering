FactoryBot.define do
  factory :order do
    status { "NEW" }
    customer_id { 1 }
  end
  factory :invalid_order, parent: :order do
    status { "BATTLE" }
    customer_id { 1 }
  end
end
