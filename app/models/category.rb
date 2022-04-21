class Category < ApplicationRecord
    has_many :menu_category
    has_many :menu, through: :menu_category
end
