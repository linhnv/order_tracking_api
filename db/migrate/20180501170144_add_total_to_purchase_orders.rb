class AddTotalToPurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :total, :decimal, default: 0
  end
end
