class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  scope :counted, -> { joins(:order).where(orders: { state: [:delivering, :completed] }) }
end
