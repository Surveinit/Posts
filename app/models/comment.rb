class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
