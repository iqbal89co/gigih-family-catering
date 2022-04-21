require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with status" do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.create(:order, customer_id: customer.id)
    expect(order).to be_valid
  end
  it "is invalid with wrong status" do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.build(:invalid_order, customer_id: customer.id)
    expect(order).to_not be_valid
  end
end
