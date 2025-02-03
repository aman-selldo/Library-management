class BooksController < ApplicationController
    def index
      @books = Book.all
      render :index
    end
  
    def show
      @book = Book.find(params[:id])
      render :show
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @book = Book.find(params[:id])  
    end
  
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_url, notice: 'Book was successfully deleted.'
    end
  
    private
  
    def book_params
      params.require(:book).permit(:title, :author_id, :category_id, :published_year)
    end
  end
  