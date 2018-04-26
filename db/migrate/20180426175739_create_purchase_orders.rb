class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.references :supplier, foreign_key: true
      t.text :notes
      t.decimal :shipment_total, default: 0
      t.decimal :adjustment_total, default: 0
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
