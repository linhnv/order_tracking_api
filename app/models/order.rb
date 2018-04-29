class Order < ApplicationRecord
  enum state: %i(requested processing delivering completed returned)

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  scope :counted, -> { where(state: [:delivering, :completed]) }

  accepts_nested_attributes_for :order_items, allow_destroy: true

  after_save :recalculate_products_count

  def items_total
    order_items.inject(0){ |sum, item| sum += item.price * item.quantity }
  end

  def total
    shipment_total + adjustment_total + items_total
  end

  private

  def recalculate_products_count
    products.each(&:reset_count)
  end
end
