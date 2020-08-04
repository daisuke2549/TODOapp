class BoardsController < ApplicationController
       
  def index
    @boards = Board.all

  def show
      @board = Board.find(params[:id])
  end
    end

  def new
     @board = Board.new
  end


    def create
      @board = Board.new(board_params)
      if @board.save
        redirect_to board_path(@board), notice: '保存できたよ'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end


    def edit
    @board = Board.find(params[:id])
    end

    def update
    @board = Board.find(params[:id])
     if @board.update(board_params)
       redirect_to board_path(@board), notice: '更新できました'
     else
       flash.now[:error] = '更新できませんでした'
       render :edit
     end
   end


    private
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
