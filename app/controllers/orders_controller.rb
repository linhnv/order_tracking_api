class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
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
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(
        :customer_id, :shipping_address, :notes, :shipment_total, :adjustment_total,
        order_items_attributes: [:order_id, :product_id, :price, :quantity]
      )
    end
end
