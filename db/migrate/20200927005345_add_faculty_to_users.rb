class AddFacultyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :faculty, :string
  end
end
