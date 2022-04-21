class Customer < ApplicationRecord
    validates :name, presence: true
    validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/i
    validates :email, presence: true, uniqueness: true
end
