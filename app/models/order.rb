class Order < ApplicationRecord
    validates :status, presence: true,  inclusion: { in: %w(NEW PAID CANCELLED), message: "%{value} not valid value" }
end
