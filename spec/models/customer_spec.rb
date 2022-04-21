require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with name and email" do
    customer = FactoryBot.create(:customer)
    expect(customer).to be_valid
  end
end
