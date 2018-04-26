class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :shipping_address
      t.text :notes
      t.decimal :shipment_total, default: 0
      t.decimal :adjustment_total, default: 0

      t.timestamps
    end
  end
end
