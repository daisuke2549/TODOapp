class BoardsController < ApplicationController
       
  def index
    @boards = Board.all.order(created_at: 'desc')
  end 

  def show
      @boards = Board.find(params[:id])
  end

  def new
     @boards = Board.new
  end


    def create
      @boards = Board.new(board_params)
      
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
