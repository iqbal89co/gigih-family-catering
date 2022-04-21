class MenuCategory < ApplicationRecord
    belongs_to :menu
    belongs_to :category
    validates :menu_id, presence: true, numericality: { only_integer: true}
    validates :category_id, presence: true, numericality: { only_integer: true}
end
