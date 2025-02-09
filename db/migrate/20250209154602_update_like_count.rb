class UpdateLikeCount < ActiveRecord::Migration[7.2]
  def change
    change_column :posts, :like_count, :integer, null: true
  end
end
