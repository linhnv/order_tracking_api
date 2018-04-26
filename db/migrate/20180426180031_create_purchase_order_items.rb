class CreatePurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_order_items do |t|
      t.references :purchase_order, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :price, default: 0
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
