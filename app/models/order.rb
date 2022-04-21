class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_menu
    validates :status, presence: true,  inclusion: { in: %w(NEW PAID CANCELLED), message: "%{value} not valid value" }
end
