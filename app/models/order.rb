class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_menu
    validates :status, presence: true,  inclusion: { in: %w(NEW PAID CANCELLED), message: "%{value} not valid value" }

  def self.get_all_orders
    @orders = Order.all
    @orders
  end

  def self.get_order(id)
    @order = Order.find(id)
    @order
  end

  def self.filter_by_email(email)
    @customer = Customer.search_by_email(email)
    @orders = Order.find_by(customer_id: @customer.id)
    @orders
  end
end
