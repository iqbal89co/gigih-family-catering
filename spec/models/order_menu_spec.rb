require 'rails_helper'

RSpec.describe OrderMenu, type: :model do
  customer = FactoryBot.create(:customer)
  order = FactoryBot.create(:order, customer_id: customer.id)
  it "is valid with order_id, price, name, and qty" do
    order_menu = FactoryBot.create(:order_menu, order_id: order.id)
    expect(order_menu).to be_valid
  end
  it "is invalid with price which have non numeric values" do
    order_menu = FactoryBot.build(:order_menu, order_id: order.id, price: "haha")
    expect(order_menu).to_not be_valid
  end
  it "is invalid with price less than 0.01" do
    order_menu = FactoryBot.build(:order_menu, order_id: order.id, price: 0.001)
    expect(order_menu).to_not be_valid
  end
end
