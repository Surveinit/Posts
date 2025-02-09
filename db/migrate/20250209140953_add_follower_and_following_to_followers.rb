class AddFollowerAndFollowingToFollowers < ActiveRecord::Migration[7.2]
  def change
    add_reference(:followers, :follower, null: false, foreign_key: {to_table: :users})
    add_reference(:followers, :following, null: false, foreign_key: {to_table: :users})
  end
end
