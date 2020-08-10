class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save!
        redirect_to tasks_path(@task), notice: '保存できました'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end

  private 
    def comment_params
      params.require(:comment).permit(:body)
    end
end
