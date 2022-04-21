class Customer < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/i
end