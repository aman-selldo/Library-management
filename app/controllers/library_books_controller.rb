class LibraryBooksController < ApplicationController

    def index
        @library = Library.find(params[:id])
        @books = @library.books
    end
  
    def new
        @library = Library.find(params[:id])
        @library_book = LibraryBook.new
    end
  
    def create
        @library = Library.find(params[:id])
        @library_book = @library.library_books.new(library_book_params)
      
        if @library_book.save
            redirect_to library_books_path(@library), notice: 'Book added to library.'
        else
            render :new
        end
    end
  
    def destroy
        @library = Library.find(params[:id])
        @library_book = @library.library_books.find(params[:id])
        @library_book.destroy
        redirect_to library_books_path(@library), notice: 'Book removed from library.'
    end
  
    private
  
    def library_book_params
        params.require(:library_book).permit(:book_id, :quantity)
    end
end
  