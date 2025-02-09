class RemoveLikeCountFromReactions < ActiveRecord::Migration[7.2]
  def change
    remove_column :reactions, :like_count, :integer
  end
end
