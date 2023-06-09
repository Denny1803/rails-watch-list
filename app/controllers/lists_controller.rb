class ListsController < ApplicationController

    def index
        @lists = List.all
        @bookmarks = Bookmark.all
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)
          if @list.save
          redirect_to lists_path, notice: "list successfully created."
          else
            render :new, status: :unprocessable_entity
          end      
      end
  
    def show
      @movies = Movie.all
      @bookmarks = Bookmark.all
      @list = List.find(params[:id])
    end


    private

    def list_params
      params.require(:list).permit(:name)
    end
end 
