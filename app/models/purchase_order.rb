class PurchaseOrder < ApplicationRecord
  enum state: %i(requested processing completed)

  belongs_to :supplier
  has_many :purchase_order_items, dependent: :destroy
  has_many :products, through: :purchase_order_items

  scope :counted, -> { where(state: :completed) }

  accepts_nested_attributes_for :purchase_order_items, allow_destroy: true

  after_save :recalculate_products_count
  before_save :reset_total

  def items_total
    purchase_order_items.inject(0){ |sum, item| sum += item.price * item.quantity }
  end

  private

  def reset_total
    self.total = shipment_total + adjustment_total + items_total
  end

  def recalculate_products_count
    products.each(&:reset_count)
  end
end
