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
           respond_to do |format|
            format.html {render_to @library, notice: 'Library created successfully'}
            format.json {render json: @library, status: :created}
           end 
        else
            respond_to do |format|
                format.html {render :new}
                format.json {render json: @library.errors, status: :unprocessable_entity}
            end 
        end
    end

    def edit
        @library = Library.find(params[:id])
    end

    def update
        @library = Library.find(params[:id])
        if @library.update(library_params)
            respond_to do |format|
                format.html {render :edit}
                format.json {render json: @library}
            end
        else 
            respond_to do |format|
                format.html {render :edit}
                format.json {render json: @library.errors, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @library = Library.find(params[:id])
        if @library.destroy
            respond_to do |format|
                format.html {redirect_to libraries_url, notice: 'Library was deleted successfully'}
                format.json {head :no_content}
            end
        else
            respond_to do |format|
                format.html {redirect_to libraries_url, alert: 'Library could not be deleted'}
                format.json {render json: {errors: 'Libaray could not be deleted!'}, status: :unprocessable_entity}
            end
        end
    end

    private

    def library_params
        params.require(:library).permit(:name, :location, :capacity)    
    end
end