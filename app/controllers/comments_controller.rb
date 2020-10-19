class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
         @book = Book.find(params[:book_id])
         @comment = @book.comments.build(comment_params)
         @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: 'books/show')
            @book.create_notification_comment!(current_user, @comment.id)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: 'books/show')
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:comment)
        end
end

