class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :update, :destroy]

  # GET /purchase_orders
  def index
    @purchase_orders = PurchaseOrder.all.includes(:purchase_order_items, :supplier)

    render json: @purchase_orders.to_json(include: [:supplier, :purchase_order_items])
  end

  # GET /purchase_orders/1
  def show
    render json: @purchase_order.to_json(include: [:supplier, :purchase_order_items])
  end

  # POST /purchase_orders
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    if @purchase_order.save
      render json: @purchase_order, status: :created, location: @purchase_order
    else
      render json: @purchase_order.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_orders/1
  def update
    if @purchase_order.update(purchase_order_params)
      render json: @purchase_order
    else
      render json: @purchase_order.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_orders/1
  def destroy
    DeleteOrderService.new(@purchase_order).perform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_order_params
      params.require(:purchase_order).permit(:supplier_id, :notes, :shipment_total, :adjustment_total, :state,
        purchase_order_items_attributes: [:id, :purchase_order_id, :product_id, :price, :quantity, :_destroy]
      )
    end
end
