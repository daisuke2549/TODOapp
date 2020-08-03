class BoardsController < ApplicationController
       
  def index
    @boards = Board.all
    end

  def new
   end

    def show
        @board = Board.find(params[:id])
    end
    
    def create
        @board = current_user.boards.build(article_params)
        if @board.save
          redirect_to board_path(@board), notice: '保存できました'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
      end

    def edit
    @board = Board.find(params[:id])
    end

    private
    def board_params
      params.require(:board).permit(:title, :content)
    end


  def set_board
    @board = Board.find(params[:id])
  end

end
