class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.decimal :price
      t.text :description
      t.string :external_urls
      t.integer :count

      t.timestamps
    end
  end
end
