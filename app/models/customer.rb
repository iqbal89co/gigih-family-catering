class Customer < ApplicationRecord
    has_many :order
    validates :name, presence: true
    validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/i
    validates :email, presence: true, uniqueness: true

  def search_by_email(email)
    @customer = Customer.find_by(email: email)
    @customer
  end

  def get_customer(id)
    @customer = Customer.find(id)
  end
end
