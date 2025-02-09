class Follower < ApplicationRecord
  validates :follower_id, uniqueness: { scope: :following_id, message: "is already following this user" }

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
end
