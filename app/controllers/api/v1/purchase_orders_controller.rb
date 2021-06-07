module Api
  class V1::PurchaseOrdersController < ApplicationController
    before_action :require_login

    # GET /v1/purchase_orders
    def index
      @purchase_orders = PurchaseOrder.where(username: current_user)
    end

    # GET /v1/purchase_orders/:id
    def show
      @purchase_order = PurchaseOrder.find(params[:id])
      if @purchase_order.username != current_user
        redirect_to '/404'
      end
    end

    # POST /v1/purchase_orders
    def create
      order_items = params[:purchase_order_items].map do |item|
        PurchaseOrderItem.create!(
          food_id: item[:id],
          count: item[:count],
          unit: item[:unit]
        )
      end

      @purchase_order = PurchaseOrder.new(
        address: params[:address],
        city: params[:city],
        customer_name: params[:customer_name],
        username: current_user,
        state: params[:state],
        country: params[:country]
      )

      if @purchase_order.save
        order_items.map{ |item| item.update(purchase_order: @purchase_order) }
        render json: {
          message: 'success',
          data: {
            order: @purchase_order
          }
        }
      else
        render json: {
          error: 'Unable to proess your order, please try again',
          data: {
            reason: @purchase_order.errors.full_messages
          }
        }, status: 400
      end
    end
  end
end
