class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
        if params[:search] == nil
            @books = Book.all.page(params[:page]).per(15)
        elsif params[:search] == ''
            @books = Book.all.page(params[:page]).per(15)
        else
            @books = Book.where("title LIKE ?",'%' + params[:search] + '%').page(params[:page]).per(3)
        end 
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @book = Book.find(params[:id])
        @comments = @book.comments
        @comment = @book.comments.build
        @like = Like.new
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to :action => "show", :id => @book.id
        else
            redirect_to :action => "new"
        end
    end
    def destroy
        Book.find(params[:id]).destroy
        redirect_to action: :index
    end
end

private
def book_params
    params.require(:book).permit(:title, :writer, :image, :classroom, :price, :user_id)
end
