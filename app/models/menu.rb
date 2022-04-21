class Menu < ApplicationRecord
    has_many :menu_category
    has_many :category, through: :menu_category
end
