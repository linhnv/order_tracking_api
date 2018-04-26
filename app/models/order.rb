class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum state: %i(requested processing delivering completed returned)
end
