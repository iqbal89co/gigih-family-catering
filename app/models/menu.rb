class Menu < ApplicationRecord
    has_many :menu_category
    has_many :category, through: :menu_category
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: {maximum: 150}
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}
end
