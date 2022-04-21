FactoryBot.define do
  factory :order do
    status { "NEW" }
  end
  factory :invalid_order, parent: :order do
    status { "BATTLE" }
  end
end
