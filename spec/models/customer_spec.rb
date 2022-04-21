require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with name and email" do
    customer = FactoryBot.create(:customer)
    expect(customer).to be_valid
  end
  it "is valid email format" do
    customer = FactoryBot.create(:customer)
    expect(customer).to be_valid
  end
  it "is invalid with wrong email format" do
    customer = FactoryBot.build(:invalid_email_customer)
    expect(customer).to_not be_valid
  end
  it "is invalid with a duplicate email" do
    customer1 = FactoryBot.create(:customer, email: 'iqbal@gmail.com')
    customer2 = FactoryBot.build(:customer, email: 'iqbal@gmail.com')
    customer2.valid?
    expect(customer2.errors[:email]).to include("has already been taken")
  end
end
