require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "is valid with a name and a description" do
    menu = FactoryBot.create(:menu)
    # menu_category = FactoryBot.create(:menu_category, menu_id: menu.id)

    expect(menu).to be_valid
  end
end
