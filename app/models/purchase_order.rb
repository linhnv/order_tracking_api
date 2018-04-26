class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  has_many :purchase_order_items

  enum state: %i(requested processing completed)

  def items_total
    purchase_order_items.inject(0){ |sum, item| sum += item.price * item.quantity }
  end

  def total
    shipment_total + adjustment_total + items_total
  end
end
