require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  it "is valid with menu_id and category_id" do
    menu = FactoryBot.create(:menu)
    category = FactoryBot.create(:category)
    menu_category = MenuCategory.create(menu_id: menu.id, category_id: category.id)
    
    expect(menu_category).to be_valid
  end
end
