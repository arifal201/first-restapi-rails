module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :search_product, only: %i[index]
    before_action :product_params, only: %i[create]
    skip_before_action :doorkeeper_authorize!, only: %i[index]
  
    # GET /products
    def index
      @products = @products.page(params[:page] || 1).per(params[:per_page] || 10).order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_product = @products.map{ |product| ProductSerializer.new(product, root: false)}

      response_pagination(serial_product, @products, 'List Products')
  
      # render json: @products
    end
  
    # GET /products/1
    def show
      render json: @product
    end
  
    # POST /products
    def create
      @product = Product.new(product_params)
  
      if @product.save
        # render json: @product, status: :created
        response_success("sukses", @product, 200)
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @product.destroy
    end
  
    private

      def search_product
        @products = if params[:search].present? && params[:search] != '{search}'
          Product.search(params[:search])
        else
          Product
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      rescue StandartError
        response_error("terjadi kesalahan harap hubungi admin", 502)
      end
  
      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :price, :description)
      end
  end
end
