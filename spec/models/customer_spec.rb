require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with name and email" do
    customer = FactoryBot.create(:customer)
    expect(customer).to be_valid
  end
  it "is invalid with wrong email format" do
    customer = FactoryBot.create(:invalid_email_customer)
    expect(customer).to_not be_valid
  end
end
