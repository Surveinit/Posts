class Follower < ApplicationRecord
  validates :follower_id, uniqueness: { scope: :following_id, message: "is already following this user" }
  validate :cannot_follow_self

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  private

  def cannot_follow_self
    errors.add(:following, "cannot be the same as follower_id") if follower_id == following_id
  end
end
