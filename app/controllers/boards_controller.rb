class BoardsController < ApplicationController
       
    def index
        @boards = Board.all
    end

    def new

    end

    def show
        @board = Board.find(params[:id])
    end

    def edit
    @board = Board.find(params[:id])
    end

    private
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
