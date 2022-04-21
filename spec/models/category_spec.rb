require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name" do
    category = FactoryBot.create(:category)

    expect(category).to be_valid
  end
  it "is invalid with duplicate name" do
    category1 = FactoryBot.create(:category, name: "indian cuisine")
    category2 = FactoryBot.build(:category, name: "indian cuisine")

    category2.valid?
    expect(category2.errors[:name]).to include("has already been taken")
  end
end
