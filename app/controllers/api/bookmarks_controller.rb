module Api
  class BookmarksController < ApplicationController
      # include ActionController::Serialization
      before_action :set_bookmark, only: [:show, :update, :destroy]
      skip_before_action :doorkeeper_authorize!, only: %i[index create]
  
      # GET /bookmarks
      def index
        @bookmarks = Bookmark.all
  
        render json: @bookmarks
        # render :json => @bookmarks, each_serializer: BookmarkSerializer
        # render(json: {
        #   bookmarks: BookmarkSerializer.new(@bookmarks)
        # })
      end
  
      # GET /bookmarks/1
      def show
        render json: @bookmark
      end

      # POST /bookmarks
      def create
        @bookmark = Bookmark.new(bookmark_params)
  
        if @bookmark.save
          render json: @bookmark, status: :created
        else
          render json: @bookmark.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /bookmarks/1
      def update
        if @bookmark.update(bookmark_params)
          render json: @bookmark
        else
          render json: @bookmark.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /bookmarks/1
      def destroy
        @bookmark.destroy
        if @bookmark.destroy
          render json: @bookmark
        else
          render json: @bookmark.errors, status: :unprocessable_entity
        end
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_bookmark
          @bookmark = Bookmark.find(params[:id])
        end
  
        # Only allow a trusted parameter "white list" through.
        def bookmark_params
          params.require(:bookmark).permit(:title, :url)
        end
    end
end
