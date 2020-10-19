class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(book_id: params[:book_id])
        redirect_back(fallback_location: books_path)
        @book = Book.find(params[:book_id])
        @book.create_notification_like!(current_user)
    end

    def destroy
        @like = Like.find_by(book_id: params[:book_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
end


# @currentUserEntry=Entry.where(user_id: current_user.id)
# @userEntry=Entry.where(user_id: @user.id)
# if @user.id == current_user.id
# else
#   @currentUserEntry.each do |cu|
#     @userEntry.each do |u|
#       if cu.room_id == u.room_id then
#         @isRoom = true
#         @roomId = cu.room_id
#       end
#     end
#   end
#   if @isRoom
#   else
#     @room = Room.new
#     @entry = Entry.new
#   end
# end