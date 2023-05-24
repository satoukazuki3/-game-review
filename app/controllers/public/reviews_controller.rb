class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    @user = current_user
  end

  def show
    @review = Review.find(params[:id])
    @review_new = Review.new
    @comment = Comment.new
    @user = @review.user
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
     @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@book), notice: "You have updated review successfully."
    else
      render "edit"
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Book.new(book_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review), notice: "You have created review successfully."
    else
      @reviews = Book.all
      @user = current_user
      render 'index'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
end
