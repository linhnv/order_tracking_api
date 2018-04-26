class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :external_urls

      t.timestamps
    end
  end
end
