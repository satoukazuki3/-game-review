class Public::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
  end

  def create
    @review = Review.find(params[:book_id])
    @new_comment = Comment.new
    @comment = current_user.comments.new(comment_params)
    @comment.review_id = @review.id
    @comment.save
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
