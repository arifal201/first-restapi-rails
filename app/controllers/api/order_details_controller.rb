module Api
  class OrderDetailsController < ApplicationController
    before_action :set_order_detail, only: [:show, :update, :destroy]
    before_action :search_order_detail, only: %i[index]
    before_action :order_detail_params, only: %i[create]
    skip_before_action :doorkeeper_authorize!, only: %i[index]
  
    # GET /order_details
    def index
      @order_details = @order_details.page(params[:page] || 1).per(params[:per_page] || 10 ).order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_order_details = @order_details.map{|order_detail| OrderDetailSerializer.new(order_detail, root: false)}

      response_pagination(serial_order_details, @order_details, 'List Order Details')
  
      # render json: @order_details
    end
  
    # GET /order_details/1
    def show
      render(json: OrderDetailSerializer.new(@order_details, root: true))
    end
  
    # POST /order_details
    def create
      @order_detail = OrderDetail.new(order_detail_params)
  
      if @order_detail.save
        # render json: @order_detail, status: :created
        response_success("Sukses", OrderDetailSerializer.new(@order_detail, root: false), 200)
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /order_details/1
    def update
      if @order_detail.update(order_detail_params)
        # render json: @order_detail
        response_success("Sukses", OrderDetailSerializer.new(@order_detail, root: false), 200)
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /order_details/1
    def destroy
      @order_detail.destroy
    end
  
    private

    def search_order_detail
      @order_details = if params[:search].present? && params[:search] != '{search}'
        OrderDetail.search(params[:search])
      else
        OrderDetail
      end
    end

      # Use callbacks to share common setup or constraints between actions.
      def set_order_detail
        @order_detail = OrderDetail.find(params[:id])
      rescue StandardError
        response_error("Terjadi Kesalahan Harap Hubungi Admin", 502)
      end
  
      # Only allow a trusted parameter "white list" through.
      def order_detail_params
        params.require(:order_detail).permit(:order_id, :product_id, :qty, :price)
      end
  end
end
