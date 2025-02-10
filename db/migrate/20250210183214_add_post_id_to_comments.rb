class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    # 1. Delete existing comments (USE WITH EXTREME CAUTION!)
    Comment.delete_all # Or Comment.destroy_all if you have dependent: :destroy in other models

    # 2. Now add the post_id column (it will be empty, so no error)
    add_column :comments, :post_id, :bigint, null: false
    add_index :comments, :post_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
