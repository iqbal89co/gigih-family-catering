require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "is valid with a name and a description" do
    menu = create(:menu)
    expect(menu).to be_valid
  end
  it "is invalid with a duplicate name" do
    menu1 = create(:menu, name: 'Nasi Bakar')
    menu2 = build(:menu, name: 'Nasi Bakar')
    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end
  it "is invalid with price which have non numeric values" do
    expect(build(:menu, price: "haha")).to_not be_valid
  end
  it "is invalid with price less than 0.01" do
    expect(build(:menu, price: 0.001)).to_not be_valid
  end
  it "is invalid with description length more than 150" do
    expect(build(:invalid_description_menu)).to_not be_valid
  end
end
