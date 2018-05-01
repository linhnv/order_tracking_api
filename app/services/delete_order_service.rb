class DeleteOrderService
  def initialize(order)
    @order = order
  end

  def perform
    product_ids = @order.products.ids
    @order.destroy
    Product.where(id: product_ids).each(&:reset_count)
  end
end