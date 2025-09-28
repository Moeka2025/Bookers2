class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
end
