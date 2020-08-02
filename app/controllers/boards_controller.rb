class BoardsController < ApplicationController
       
    def index
        @boards = Board.first
    end

    def new
        @board = Board.new
    end

    def show
        @board = Board.find(params[:id])
    end
    
    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: '保存できたよ'
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
