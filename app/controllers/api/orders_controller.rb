module Api
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    before_action :search_order, only: %i[index]
    before_action :order_params, only: %i[create]
    skip_before_action :doorkeeper_authorize!, only: %i[index]
  
    # GET /orders
    def index
      @orders = @orders.page(params[:page] || 1).per(params[:per_page] || 10).order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_order = @orders.map{|order| OrderSerializer.new(order, root:false)}

      response_pagination(serial_order, @orders, 'List Orders')
  
      # render json: @orders
    end
  
    # GET /orders/1
    def show
      response_success("sukses", OrderSerializer.new(@order, root: false), 200)
    end
  
    # POST /orders
    def create
      @order = Order.new(order_params)
  
      if @order.save
        # render json: @order, status: :created
        response_success("sukses", OrderSerializer.new(@order, root: false), 200)
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        response_success("sukses", OrderSerializer.new(@order, root: false), 200)
        # render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /orders/1
    def destroy
      @order.destroy
      response_success("sukses", OrderSerializer.new(@order, root: false), 200)
    end
  
    private

    def search_order
      @orders = if params[:search].present? && params[:search] != '{search}'
        Order.search(params[:search])
      else
        Order
      end
    end

      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      rescue StandartError
        response_error("terjadi kesalahan harap hubungi admin", 502)
      end
  
      # Only allow a trusted parameter "white list" through.
      def order_params
        params.fetch(:order).permit(:customer_id, :date, :total, :status, order_details_attributes: %i[
          id qty price product_id order_id
        ])
      end
  end
end
