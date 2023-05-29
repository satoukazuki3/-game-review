class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @review = Review.new
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @review = Review.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
end
