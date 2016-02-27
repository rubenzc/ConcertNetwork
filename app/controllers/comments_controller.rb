class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @concert = Concert.find params[:concert_id]
    @concert_comments = @concert.comments
    @comment = @concert.comments.new(comment_params)
    if @comment.save
      redirect_to concert_path(id: params[:concert_id])
    else
      flash[:alert] = "There are some errors with your comment"
      redirect_to concert_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment, :date)
  end
end