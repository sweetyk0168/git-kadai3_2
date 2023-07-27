class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/'
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
