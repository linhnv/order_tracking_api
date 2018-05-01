class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all.includes(:order_items, :customer)

    render json: @orders.to_json(include: [:customer, :order_items], methods: [:total])
  end

  # GET /orders/1
  def show
    render json: @order.to_json(include: [:customer, :order_items], methods: [:total])
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    DeleteOrderService.new(@order).perform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(
        :customer_id, :shipping_address, :notes, :shipment_total, :adjustment_total, :state,
        order_items_attributes: [:id, :order_id, :product_id, :price, :quantity, :_destroy]
      )
    end
end
