class PurchaseOrder < ApplicationRecord
  belongs_to :supplier

  enum state: %i(requested processing completed)
end
