class LibraryBooksController < ApplicationController
    def index
        @library = Library.find(params[:library_id])
        @books = @library.books

        respond_to do |format|
            format.html
            format.json {render json: {library: @library, books: @books}}
        end 
    end
  
    def new
        @library = Library.find(params[:library_id])
        @library_book = LibraryBook.new
    end
  
    def create
        @library = Library.find(params[:library_id])
        @library_book = @library.library_books.new(library_book_params)
      
        respond_to do |format|
            if @library_book.save
                format.html{redirect_to library_library_books_path(@library), notice: 'Book was added to library'}
                format.json{render json: @library_book, status: :created}
            else
                format.html{render :new}
                format.json{render json: @library_book.errors, status: :unprocessable_entity}
            end
        end
    end
  
    def destroy
        @library = Library.find(params[:library_id])
        @library_book = @library.library_books.find_by(id: params[:id]) # Use find_by to avoid exceptions
      
        if @library_book
          @library_book.destroy
          respond_to do |format|
            format.html { redirect_to library_library_books_path(@library), notice: 'Book removed from library.' }
            format.json { head :no_content }
          end
        else
          respond_to do |format|
            format.html { redirect_to library_library_books_path(@library), alert: 'Book not found.' }
            format.json { render json: { error: 'LibraryBook not found' }, status: :unprocessable_entity }
          end
        end
    end
    private
  
    def library_book_params
        params.require(:library_book).permit(:book_id, :quantity)
    end
end