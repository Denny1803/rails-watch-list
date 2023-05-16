class BookmarksController < ApplicationController
    before_action :set_list
    before_action :set_bookmark, only: [:edit, :update, :show]
    
    def index
        @bookmarks = Bookmark.all
    end

    def new
        @bookmark = Bookmark.new
        @movie = Movie.all
    end

    def create
        @bookmark = Bookmark.new(bookmark_params)
        
        @bookmark.list = @list
          if @bookmark.save
          redirect_to list_path(@list), notice: "bookmark successfully created."
          else
            render :new, status: :unprocessable_entity
          end      
      end
  
    def show
    end

    private

    def set_list
        @list = List.find(params[:list_id])
    end

    def set_bookmark
        @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id, :list_id)
    end
end
