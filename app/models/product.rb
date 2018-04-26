class Product < ApplicationRecord
  has_many :order_items
  has_many :purchase_order_items
end
