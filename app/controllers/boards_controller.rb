class BoardsController < ApplicationController
       
  def index
    @boards = Board.all.order(created_at: 'desc')
  end 

  def show
    @boards = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
      if @board.save!
        redirect_to boards_path(@board), notice: '保存できました'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
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

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to root_path, notice: '削除に成功しました'
  end

private
  def board_params
    params.require(:board).permit(:title, :content)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
