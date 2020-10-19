class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :writer
      t.string :image
      t.string :classroom
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
