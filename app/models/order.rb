class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum state: %i(requested processing delivering completed returned)

  def items_total
    order_items.inject(0){ |sum, item| sum += item.price * item.quantity }
  end

  def total
    shipment_total + adjustment_total + items_total
  end
end
