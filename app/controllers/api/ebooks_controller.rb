module Api
  class EbooksController < ApplicationController
    before_action :set_ebook, only: [:show, :update, :destroy]
    skip_before_action :doorkeeper_authorize!, only: %i[index]

    # GET /ebooks
    def index
      @ebooks = Ebook.all

      @ebooks = Ebook.page(params[:page] || 1).per(params[:per_page] || 10)
      .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

      serial_ebook = @ebooks.map { |ebook| EbookSerializer.new(ebook, root: false) }

  # render(json: { data: [serial_user] }, status: 200)

      response_pagination(serial_ebook, @ebooks, 'List User')
    end

    # GET /ebooks/1
    def show
      render json: @ebook
    end

    # POST /ebooks
    def create
      @ebook = Ebook.new(ebook_params)

      if @ebook.save
        render json: @ebook, status: :created
      else
        render json: @ebook.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /ebooks/1
    def update
      if @ebook.update(ebook_params)
        render json: @ebook
      else
        render json: @ebook.errors, status: :unprocessable_entity
      end
    end

    # DELETE /ebooks/1
    def destroy
      @ebook.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ebook
        @ebook = Ebook.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ebook_params
        params.require(:ebook).permit(:title, :name)
      end
  end
end