class LibrariesController < ApplicationController

    def index
        @libraries = Library.all

        respond_to do |format|
            format.html
            format.json {render json: @libraries}
        end
    end

    def show
        @library = Library.find(params[:id])
        @books = @library.books
        respond_to do |format|
            format.html
            format.json {render json: {library: @library, books: @books }}
        end
    end 

    def new
        @library = Library.new
    end

    def create
        @library = Library.new(library_params)
        if @library.save
            redirect_to @library, notice: 'Library created successfully'
        else
            render :new
        end
    end

    def edit
        @library = Library.find(params[:id])
    end

    def update
        @library = Library.find(params[:id])
        if @library.update(library_params)
            redirect_to @library, notice: 'Library was updated successfully.'
        else
            render :edit
        end
    end

    def destroy
        @library = Library.find(params[:id])
        @library.destroy
        redirect_to libraries_url, notice: 'Library was deleted successfully'
    end

    private

    def library_params
        params.require(:library).permit(:name, :location, :capacity)    
    end
end
