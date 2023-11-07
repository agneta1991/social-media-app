class AddDefaultCounters < ActiveRecord::Migration[7.1]
    def up
      change_column :users, :post_counter, :integer, default: 0
      change_column :posts, :comments_counter, :integer, default: 0
      change_column :posts, :likes_counter, :integer, default: 0
    end
  
    def down
      change_column :users, :post_counter, :integer, default: nil
      change_column :posts, :comments_counter, :integer, default: nil
      change_column :posts, :likes_counter, :integer, default: nil
    end
end
