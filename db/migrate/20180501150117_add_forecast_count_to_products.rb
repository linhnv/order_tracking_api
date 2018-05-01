class AddForecastCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :forecast_count, :integer, default: 0
  end
end
