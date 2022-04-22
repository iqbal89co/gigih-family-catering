class OrderMenu < ApplicationRecord
    belongs_to :order
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}
    validates :qty, presence: true, numericality: { only_integer: true}

    # validate :menu_exists

    # def menu_exists
    #     errors.add(:base, "Menu doesn't exist in database") unless Menu.name.include?(self.name)
    # end
  def self.get_all(order_id)
    @order_menus = OrderMenu.find_by(order_id: order_id)
    @order_menus
  end
  def self.get_order_menu(id)
    @order_menu = OrderMenu.find(id)
    @order_menu
  end
end
