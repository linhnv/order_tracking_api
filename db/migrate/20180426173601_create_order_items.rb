class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :price, default: 0
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
