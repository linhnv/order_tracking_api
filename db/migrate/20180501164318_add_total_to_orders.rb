class AddTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total, :decimal, default: 0
  end
end
