class AddUsersCountToBooks < ActiveRecord::Migration[5.2]
  def self.up
    add_column :books, :users_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :books, :users_count
  end
end
