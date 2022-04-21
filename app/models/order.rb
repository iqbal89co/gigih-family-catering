class Order < ApplicationRecord
    belongs_to :customer
    validates :status, presence: true,  inclusion: { in: %w(NEW PAID CANCELLED), message: "%{value} not valid value" }
end
