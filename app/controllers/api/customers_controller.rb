module Api
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :update, :destroy]
    # skip_before_action :doorkeeper_authorize!, only: %i[index]
    before_action :search_customer, only: %i[index]
    before_action :customer_params, only: %i[create]
  
    # GET /customers
    def index
      @customers = @customers.page(params[:page] || 1).per(params[:per_page] || 10).order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_customer = @customers.map{|customer| CustomerSerializer.new(customer, root: false) }
  
      response_pagination(serial_customer, @customers, 'List Customer')
      # render json: @customers
    end
  
    # GET /customers/1
    def show
      render json: CustomerSerializer.new(@customer)
    end
  
    # POST /customers
    def create
      @customer = Customer.new(customer_params)
  
      if @customer.save
        # render json: @customer, status: :created
        response_success('Sukses', CustomerSerializer.new(@customer, root: false), 200)
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /customers/1
    def update
      if @customer.update(customer_params)
        render json: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /customers/1
    def destroy
      @customer.destroy
    end
  
    private

      def search_customer
        @customers = if params[:search].present? && params[:search] != '{search}'
          Customer.search(params[:search])
        else
          Customer
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_customer
        @customer = Customer.find(params[:id])
      rescue StandardError
        response_error("Terjadi Kesalahan Harap Hubungi Admin", 502)
      end
  
      # Only allow a trusted parameter "white list" through.
      def customer_params
        params.require(:customer).permit(:name, :address, :phone)
      rescue StandardError
        response_error("Terjadi Kesalahan Harap Hubungi Admin", 502)
      end
  end
end
