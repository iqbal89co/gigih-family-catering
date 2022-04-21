class OrderMenu < ApplicationRecord
    belongs_to :order
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}
    validates :qty, presence: true, numericality: { only_integer: true}

    # validate :menu_exists

    # def menu_exists
    #     errors.add(:base, "Menu doesn't exist in database") unless Menu.name.include?(self.name)
    # end
end
