class GetStatisticsService
  def self.perform
    new.perform
  end

  def perform
    {
      total_revenue: total_revenue,
      total_profit: total_profit,
      total_orders_count: total_orders_count,
      new_orders_count: new_orders_count
    }
  end

  private
  def total_revenue
    Order.counted.sum(:total)
  end

  def total_profit
    Order.counted.sum(:total) - Order.counted.sum(:shipment_total) - PurchaseOrder.counted.sum(:total)
  end

  def total_orders_count
    Order.count
  end

  def new_orders_count
    Order.where(state: :requested).count
  end
end