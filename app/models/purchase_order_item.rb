class PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :product

  scope :counted, -> { joins(:purchase_order).where(purchase_orders: { state: :completed }) }
end
