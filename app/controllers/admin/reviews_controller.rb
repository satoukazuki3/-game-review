class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @review_new = Review.new
    @comment = Comment.new
    @user = @review.user
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
end
