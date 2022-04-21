require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with status" do
    order = FactoryBot.create(:order)
    expect(order).to be_valid
  end
end
