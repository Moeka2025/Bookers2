class HomesController < ApplicationController
  def top
    @user = current_user
    @book = Book.new
    @books = @user.books
  end

  def about
  end
end
