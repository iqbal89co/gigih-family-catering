require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "is valid with a name and a description" do
    menu = FactoryBot.create(:menu)
    # menu_category = FactoryBot.create(:menu_category, menu_id: menu.id)

    expect(menu).to be_valid
  end
  it "is invalid with a duplicate name" do
    menu1 = FactoryBot.create(:menu, name: 'Nasi Uduk')
    menu2 = FactoryBot.build(:menu, name: 'Nasi Uduk')
    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end
end
