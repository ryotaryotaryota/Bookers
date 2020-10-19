class AddCommentToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :comment, :text
  end
end
