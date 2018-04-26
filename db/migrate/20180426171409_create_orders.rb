class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :shipping_address
      t.text :notes
      t.decimal :shiment_total
      t.decimal :adjustment_total

      t.timestamps
    end
  end
end
