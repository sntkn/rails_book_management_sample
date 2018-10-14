class AddIndexToUserBooks < ActiveRecord::Migration[5.2]
  def change
    add_index :user_books, [:user_id, :book_id], :unique => true, :name => 'index_user_id_book_id'
  end
end
