class Order < ApplicationRecord
  belongs_to :customer

  enum state: %i(requested processing delivering completed returned)
end
