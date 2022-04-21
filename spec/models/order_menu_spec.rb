require 'rails_helper'

RSpec.describe OrderMenu, type: :model do
  it "is valid with order_id, price, name, and qty" do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.create(:order, customer_id: customer.id)
    order_menu = FactoryBot.create(:order_menu, order_id: order.id)
    expect(order_menu).to be_valid
  end
end
