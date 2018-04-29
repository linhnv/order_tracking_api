class Product < ApplicationRecord
  has_many :order_items
  has_many :purchase_order_items

  def imported_count
    purchase_order_items.counted.sum(:quantity)
  end

  def sold_count
    order_items.counted.sum(:quantity)
  end

  def remaining
    imported_count - sold_count
  end

  def reset_count
    update(count: remaining)
  end
end
