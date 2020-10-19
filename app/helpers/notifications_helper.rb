module NotificationsHelper
    def notification_form(notification)
        @visitor = notification.visitor
        @comment = nil
        @message = nil
        your_book = link_to 'あなたの投稿', book_path(notification), style:"font-weight: bold;"
        @visitor_comment = notification.comment_id
        @visitor_message = notification.message_id
        #notification.actionがlikeかcommentかmessageか
        case notification.action
          when "like" then
            tag.a(notification.visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの出品', href:book_path(notification.book_id), style:"font-weight: bold;")+"に購入申請しました"
          when "comment" then
            @comment = Comment.find_by(id: @visitor_comment)
            tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:book_path(notification.book_id), style:"font-weight: bold;")+"にコメントしました"
          when "message" then
            @message = Message.find_by(id: @visitor_message)
            tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+"あなたにDMを送りました。"
        end
    end
end
